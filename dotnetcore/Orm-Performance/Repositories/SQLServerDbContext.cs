using Microsoft.EntityFrameworkCore;
using Orm_Performance.Entities;

namespace Orm_Performance.Repositories
{
    public class SQLServerDbContext : DbContext
    {
        public SQLServerDbContext(DbContextOptions<SQLServerDbContext> options) : base(options) { }

        public DbSet<Estado> Estado { get; set; }
        public DbSet<Cidade> Cidade { get; set; }
        public DbSet<CadastroCliente> CadastroCliente { get; set; }
        public DbSet<Produto> Produto { get; set; }
        public DbSet<Vendas> Vendas { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Cidade>()
                .HasOne(e => e.Estado)
                .WithMany()
                .HasForeignKey(c => c.Id_Estado);

            modelBuilder.Entity<CadastroCliente>()
                .HasOne(c => c.Cidade)
                .WithMany()
                .HasForeignKey(cc => cc.Id_Cidade);

            modelBuilder.Entity<Vendas>()
                .HasOne(v => v.Cliente)
                .WithMany()
                .HasForeignKey(v => v.Id_Cliente);

            modelBuilder.Entity<Vendas>()
                .HasOne(v => v.Produto)
                .WithMany()
                .HasForeignKey(v => v.Id_Produto);
        }
    }
}
