namespace MultiTenant.DataAccessLayer.Entities;

public class Restaurant
{
    public Guid Id { get; set; }

    public string Name { get; set; }

    public string Street { get; set; }

    public string ZipCode { get; set; }

    public string City { get; set; }

    public string Phone { get; set; }

    public string ImageUrl { get; set; }

    public string WebSite { get; set; }
}
