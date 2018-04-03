defmodule Igdb.Company do
  @moduledoc """
  Represents an Collection resource in the IGDB API.

  - [Company docs](https://igdb.github.io/api/endpoints/company/)

  ## Examples

      Igdb.Company.get(1)
      {:ok,
      %Igdb.Company{
        change_date: nil,
        change_date_category: 7,
        changed_company_id: 5,
        country: 840,
        created_at: 1297810753000,
        description: "Electronic Arts Inc. is a leading global interactive entertainment software company. EA delivers games, content and online services for Internet-connected consoles, personal computers, mobile phones and tablets.",
        developed: [3632, 3633, 3431, 2656, 5155, 5053, 5530, 5363, 5396, 6211, 6631,
          6798, 1621, 8100, 11235, 11675, 4588, 18705, 8813, 12714, 4587, 19418, 4429,
          4394, 19772, 13838, 51953, 26013, 27075, 12770, 12267, 43280, 5338, 4409,
          48181],
        id: 1,
        logo: %{
          "cloudinary_id" => "i9s3h5sqtvzisfwik1za",
          "height" => 783,
          "url" => "//images.igdb.com/igdb/image/upload/t_thumb/i9s3h5sqtvzisfwik1za.jpg",
          "width" => 783
        },
        name: "Electronic Arts",
        published: [1274, 36, 296, 1268, 1059, 1832, 74, 1314, 1310, 585, 321, 1828,
          2249, 3553, 3852, 336, 240, 349, 335, 76, 1216, 1006, 343, 1306, 3126, 2153,
          3901, 4033, 4042, 3886, 4032, 503, 4041, 4778, 899, 4160, 2250, ...],
        slug: "electronic-arts",
        start_date: 391392000000,
        start_date_category: 0,
        twitter: "https://twitter.com/EA",
        updated_at: 1522571884772,
        url: "https://www.igdb.com/companies/electronic-arts",
        website: "http://www.ea.com/"
      }}
  """

  defstruct id: nil,
            name: nil,
            slug: nil,
            url: nil,
            created_at: nil,
            updated_at: nil,
            logo: nil,
            description: nil,
            country: nil,
            website: nil,
            start_date: nil,
            start_date_category: nil,
            changed_company_id: nil,
            change_date: nil,
            change_date_category: nil,
            twitter: nil,
            published: nil,
            developed: nil

  use Igdb.Resource

  def resource_collection_name, do: "companies"
end
