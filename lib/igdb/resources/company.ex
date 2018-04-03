defmodule Igdb.Company do
  @moduledoc """
  Represents an Collection resource in the IGDB API.
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
