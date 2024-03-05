using System.ComponentModel.DataAnnotations;

namespace Orm_Performance.Entities
{
    public class Vendas
    {
        [Key]
        public long Id { get; set; }
        public Guid Pedido { get; set; }
        public int Id_Cliente { get; set; }
        public short Id_Produto { get; set; }
        public short Quantidade { get; set; }
        public decimal Valor_Unitario { get; set; }
        public DateTime Data_Venda { get; set; }
        public string? Observacao { get; set; }
        public CadastroCliente Cliente { get; set; }
        public Produto Produto { get; set; }
    }
}
