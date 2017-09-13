using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CharityOrganisation.BusinessLayer.MenuOperations
{
    public class MenuDb : DbItem
    {
        private int idMenu;

        public int IdMenu
        {
            get { return idMenu; }
            set { idMenu = value; }
        }
        private string title;

        public string Title
        {
            get { return title; }
            set { title = value; }
        }
        private int priority;

        public int Priority
        {
            get { return priority; }
            set { priority = value; }
        }
        private string link;

        public string Link
        {
            get { return link; }
            set { link = value; }
        }
    }

    public class MenuOpBase : Operacija {
        public override OperacijaRezultat izvrsi(DataLayer.CharityOrganisationDatabaseEntities entiteti)
        {
            IEnumerable<MenuDb> ieMenus;

            ieMenus = from menu in entiteti.Menus
                      orderby menu.priority descending
                       select new MenuDb
                       {
                           IdMenu=menu.idMenu,
                           Title=menu.title,
                           Priority=menu.priority,
                           Link=menu.link
                       };

            MenuDb[] niz = ieMenus.ToArray();

            OperacijaRezultat obj = new OperacijaRezultat();
            obj.DbItems = niz;
            obj.Status = true;
            return obj;
        }
    }
}