using System.ComponentModel.DataAnnotations;

namespace Orm_Performance.Entities
{
    public class Produto
    {
        [Key]
        public short Id { get; set; }
        public string Descricao { get; set; }
    }
}
