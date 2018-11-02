using LoginMVC.Manager;
using LoginMVC.Models;
using System.Web.Mvc;

namespace LoginMVC.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Title = "Home Page";

            return RedirectToAction("Login");
        }

        public ActionResult Login()
        {
            return View();
        }

        public ActionResult Register()
        {
            return View();
        }

        public ActionResult Main(string userName)
        {
            if (userName != null)
            {
                LoginManager login = new LoginManager();
                Employee emp = login.GetCurrentEmployee(userName);
                ViewBag.Employee = emp;
                return View();
            }
            else {
                return RedirectToAction("Login");
            }
        }

        [HttpPost]
        public ActionResult CheckLogin(Employee emp)
        {
            LoginManager login = new LoginManager();
            return Json(login.CheckLogin(emp));
        }

        [HttpPost]
        public ActionResult RegisterUser(Employee register)
        {
            LoginManager login = new LoginManager();
            return Json(login.RegisterUser(register), JsonRequestBehavior.AllowGet);
        }
    }
}
