using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Metrix_HW
{
    public class Talent
    {
        public int Talent_ID { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string DOB { get; set; }
        public string Specialization { get; set; }
        public string Age { get; set; }
        public Talent(int ID,string name, string email, string specialization,string DateOfBirth, int age)
        {
            this.Talent_ID = ID;
            this.Name = name;
            this.Email = email;
            this.DOB = DateOfBirth;
            this.Specialization = specialization;
            this.Age = age.ToString();
        }

    }
}