using System.ComponentModel.DataAnnotations;

namespace Orm_Performance.Entities
{
    public class Estado
    {
        [Key]
        public byte Id { get; set; }
        public string Descricao { get; set; }
    }
}
