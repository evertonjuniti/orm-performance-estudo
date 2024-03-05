using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Orm_Performance.Entities;
using Orm_Performance.Repositories;

namespace Orm_Performance.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class VendasController : ControllerBase
    {
        private readonly SQLServerDbContext _context;

        public VendasController(SQLServerDbContext context)
        {
            _context = context;
        }

        // GET: api/Vendas
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Vendas>>> GetVendas(Guid? pedido = null, 
            DateTime? dataInicial = null, DateTime? dataFinal = null)
        {
            IQueryable<Vendas> query = _context.Vendas
                .Include(v => v.Cliente)
                .Include(v => v.Produto);

            query = query.Where(v => (!pedido.HasValue || v.Pedido == pedido.Value) &&
                                     (!dataInicial.HasValue || v.Data_Venda.Date >= dataInicial.Value.Date) &&
                                     (!dataFinal.HasValue || v.Data_Venda.Date <= dataFinal.Value.Date));

            return await query.ToListAsync();
        }
    }
}
