﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SoldatovaCRUD.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class SoldatovaCRUDEntities1 : DbContext
    {
        public SoldatovaCRUDEntities1()
            : base("name=SoldatovaCRUDEntities1")
        {
        }
        public static SoldatovaCRUDEntities2 context;

        public static SoldatovaCRUDEntities2 getcontext()
        {
            if (context == null)
            {
                context = new Models.SoldatovaCRUDEntities2();
            }
            return context;

        }
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<EntryHistory> EntryHistories { get; set; }
        public virtual DbSet<EntryType> EntryTypes { get; set; }
        public virtual DbSet<Merch> Merches { get; set; }
        public virtual DbSet<Order> Orders { get; set; }
        public virtual DbSet<OrderMerch> OrderMerches { get; set; }
        public virtual DbSet<Place> Places { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<Worker> Workers { get; set; }
    }
}
