namespace MultiTenant.Shared.Models;

public class Address
{
    public string PostalCode { get; set; }

    public string Street { get; set; }

    public string Location { get; set; }

    public override string ToString()
    {
        var address = $"{Street}, {PostalCode}, {Location}";
        return address;
    }
}
