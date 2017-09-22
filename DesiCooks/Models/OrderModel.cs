using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DesiCooks.Models
{
    public class OrderModel
    {
        public OrderModel()
        {
            food = new List<int>();
        }
        public long orderId { get; set; }
        public string firstName { get; set; }
        public string lastName { get; set; }
        public string city { get; set; }
        public string postalCode { get; set; }
        public long phoneNumber { get; set; }
        public int province { get; set; }
        public List<int> food { get; set; }
        public string comments { get; set; }
        public string deliveryType { get; set; }
    }
}