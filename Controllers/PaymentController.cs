using Microsoft.AspNetCore.Mvc;
using System.Text;
using System.Text.Json.Nodes;

namespace MindCare_Pro.Controllers
{
    public class PaymentController : Controller
    {
        private string PaypalClientId { get; set; } = "";
        private string PaypalSecret { get; set; } = "";
        private string PaypalUrl { get; set; } = "";


        public PaymentController(IConfiguration configuration)
        {
            PaypalClientId = configuration["PaypalSettings:ClientId"]!;
            PaypalSecret = configuration["PaypalSettings:Secret"]!;
            PaypalUrl = configuration["PaypalSettings:Url"]!;
        }

        public IActionResult Index()
        {
            ViewBag.PaypalClientId = PaypalClientId;
            ViewBag.DoctorId = TempData["DoctorId"];
            ViewBag.DoctorName = TempData["DoctorName"];
            ViewBag.Date = TempData["Date"];
            ViewBag.Time = TempData["Time"];
            ViewBag.Fee = TempData["Fee"];

            TempData.Keep();
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> CreateOrder([FromBody] JsonObject data)
        {
            var totalAmount = data?["amount"]?.ToString();
            if (totalAmount == null)
            {
                return new JsonResult(new { id = "" });
            }

            JsonObject createOrderRequest = new JsonObject();


            createOrderRequest.Add("intent", "CAPTURE");

            JsonObject amount = new JsonObject();
            double lkrAmount = Convert.ToDouble(totalAmount);

           
            double usdAmount = lkrAmount / 300.0;

            amount.Add("currency_code", "USD");
            amount.Add("value", usdAmount.ToString("F2"));

            JsonObject purchaseUnit1 = new JsonObject();
            purchaseUnit1.Add("amount", amount);

            JsonArray purchaseUnits = new JsonArray();
            purchaseUnits.Add(purchaseUnit1);

            createOrderRequest.Add("purchase_units", purchaseUnits);

            string accessToken = await GetPaypalAccessToken();
            string url = PaypalUrl + "/v2/checkout/orders";

            using (var client = new HttpClient())
            {
                client.DefaultRequestHeaders.Add("Authorization", "Bearer " + accessToken);

                var requestMessage = new HttpRequestMessage(HttpMethod.Post, url);
                requestMessage.Content = new StringContent(createOrderRequest.ToString(), null, "application/json");

                var httpResponse = await client.SendAsync(requestMessage);

                var strResponse = await httpResponse.Content.ReadAsStringAsync();

                if (httpResponse.IsSuccessStatusCode)
                {
                    var jsonResponse = JsonNode.Parse(strResponse);
                    if (jsonResponse != null)
                    {
                        string paypalOrderId = jsonResponse["id"]?.ToString() ?? "";


                        return new JsonResult(new { id = paypalOrderId });
                    }
                }
            }

            return new JsonResult(new { id = "" });
        }

        /*
        public async Task<string> Token()
        {
            return await GetPaypalAccessToken();
        }
        */

        private async Task<string> GetPaypalAccessToken()
        {
            string accessToken = "";
            string url = PaypalUrl + "/v1/oauth2/token";
            using (var client = new HttpClient())
            {
                string credentials64 =
                    Convert.ToBase64String(Encoding.UTF8.GetBytes(PaypalClientId + ":" + PaypalSecret));
                client.DefaultRequestHeaders.Add("Authorization", "Basic " + credentials64);

                var requestMessage = new HttpRequestMessage(HttpMethod.Post, url);
                requestMessage.Content = new StringContent("grant_type=client_credentials", null, "application/x-www-form-urlencoded");
                var httpResponse = await client.SendAsync(requestMessage);

                if (httpResponse.IsSuccessStatusCode)
                {
                    var strResponse = await httpResponse.Content.ReadAsStringAsync();
                    var jsonResponse = JsonNode.Parse(strResponse);
                    if (jsonResponse != null)
                    {
                        accessToken = jsonResponse["access_token"]?.ToString() ?? "";
                    }
                }

            }


            return accessToken;
        }
    }
}
