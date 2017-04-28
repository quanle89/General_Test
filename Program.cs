using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net;
using Newtonsoft.Json;

namespace LoadFriends
{
    class User
    {
        public int id { get; set; }
        public string name { get; set; }
        public int[] friends { get; set; }
    }
    class Program
    {
        private static LinkedList<string> idList = new LinkedList<string>();
        static void Main(string[] args)
        {
            using (WebClient webClient = new WebClient())
            {
                Console.WriteLine("Enter input:");
                string id = Console.ReadLine();
                Console.WriteLine("Waiting...");
                LoadJsonFriend(id);
                Console.ReadLine();
            }           
        }
        private static void LoadJsonFriend(string friendId)
        {
            string jsonLink = "http://fg-69c8cbcd.herokuapp.com/user/" + friendId;
            using (WebClient webClient = new WebClient())
            {
                var json = webClient.DownloadString(jsonLink);
                string OriValue = Convert.ToString(json);                
                User user = JsonConvert.DeserializeObject<User>(OriValue);
                LinkedListNode<string> node = idList.Find(friendId);
                if (node == null)
                {
                    Console.WriteLine(OriValue);
                    idList.AddLast(friendId);
                    foreach (var f in user.friends)
                    {
                        LoadJsonFriend(f.ToString());
                    }
                }
            }
        }
    }
}
