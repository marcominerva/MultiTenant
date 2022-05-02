using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using MultiTenant.DataAccessLayer.Entities;

namespace MultiTenant.DataAccessLayer.Configurations;

public class RestaurantConfiguration : IEntityTypeConfiguration<Restaurant>
{
    public void Configure(EntityTypeBuilder<Restaurant> builder)
    {
        builder.ToTable("Restaurants");
        builder.HasKey(x => x.Id);

        builder.Property(x => x.Id).ValueGeneratedOnAdd();
        builder.Property(x => x.Name).HasMaxLength(100).IsRequired().IsUnicode(false);
        builder.Property(x => x.Street).HasMaxLength(100).IsRequired().IsUnicode(false);
        builder.Property(x => x.ZipCode).HasMaxLength(5).IsRequired().IsUnicode(false);
        builder.Property(x => x.City).HasMaxLength(100).IsRequired().IsUnicode(false);
        builder.Property(x => x.Phone).HasMaxLength(20).IsUnicode(false);
        builder.Property(x => x.ImageUrl).HasMaxLength(1000).IsUnicode(false);
        builder.Property(x => x.WebSite).HasMaxLength(1000).IsUnicode(false);
    }
}
