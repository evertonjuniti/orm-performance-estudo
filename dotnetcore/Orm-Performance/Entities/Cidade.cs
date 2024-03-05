using System.ComponentModel.DataAnnotations;

namespace Orm_Performance.Entities
{
    public class Cidade
    {
        [Key]
        public short Id { get; set; }
        public byte Id_Estado { get; set; }
        public string Descricao { get; set; }
        public Estado Estado { get; set; }
    }
}
