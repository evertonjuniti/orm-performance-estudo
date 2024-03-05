using System.ComponentModel.DataAnnotations;

namespace Orm_Performance.Entities
{
    public class CadastroCliente
    {
        [Key]
        public int Id { get; set; }
        public string Nome { get; set; }
        public string Endereco { get; set; }
        public short Id_Cidade { get; set; }
        public string Email { get; set; }
        public string Telefone1 { get; set; }
        public string? Telefone2 { get; set; }
        public string? Telefone3 { get; set; }
        public Cidade Cidade { get; set; }
    }
}
