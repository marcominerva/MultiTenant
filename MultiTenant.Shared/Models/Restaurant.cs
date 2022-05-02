namespace MultiTenant.Shared.Models;

public class Restaurant
{
    public Guid Id { get; set; }

    public string Name { get; set; }

    public Address Address { get; set; }

    public string PhoneNumber { get; set; }

    public string ImageUrl { get; set; }

    public string WebSite { get; set; }
}
