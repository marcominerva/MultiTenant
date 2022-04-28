namespace MultiTenant.Shared.Models;

public class RegisterResponse
{
    public bool Succeeded { get; set; }

    public IEnumerable<string> Errors { get; set; }
}
