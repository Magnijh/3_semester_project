using System;
using System.ComponentModel.DataAnnotations;

namespace FullcalendarMvcApp
{
    public class EventViewModel
    {
        public Int64 id { get; set; }

        public String title { get; set; }

        public DateTime start { get; set; }

        public DateTime end { get; set; }

        public string rendering { get; set; }

        public string color { get; set; }

        public bool allDay { get; set; }

        public string Note { get; set; }
    }
}