# typed: strict
# frozen_string_literal: true

$VERBOSE = nil
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "..", "lib"))

require "minitest/autorun"
require "webmock/minitest"

require "shopify_api"
require_relative "../../test_helper"

class CollectionListing202104Test < Test::Unit::TestCase
  def setup
    super

    @test_session = ShopifyAPI::Auth::Session.new(id: "id", shop: "test-shop.myshopify.io", access_token: "this_is_a_test_token")
    modify_context(api_version: "2021-04")
  end

  sig do
    void
  end
  def test_1()
    stub_request(:get, "https://test-shop.myshopify.io/admin/api/2021-04/collection_listings.json")
      .with(
        headers: {"X-Shopify-Access-Token"=>"this_is_a_test_token", "Accept"=>"application/json"},
        body: {}
      )
      .to_return(status: 200, body: "{}", headers: {})

    ShopifyAPI::CollectionListing.all(
      session: @test_session,
    )

    assert_requested(:get, "https://test-shop.myshopify.io/admin/api/2021-04/collection_listings.json")
  end

  sig do
    void
  end
  def test_2()
    stub_request(:get, "https://test-shop.myshopify.io/admin/api/2021-04/collection_listings/841564295/product_ids.json")
      .with(
        headers: {"X-Shopify-Access-Token"=>"this_is_a_test_token", "Accept"=>"application/json"},
        body: {}
      )
      .to_return(status: 200, body: "{}", headers: {})

    ShopifyAPI::CollectionListing.product_ids(
      session: @test_session,
      collection_id: 841564295,
    )

    assert_requested(:get, "https://test-shop.myshopify.io/admin/api/2021-04/collection_listings/841564295/product_ids.json")
  end

  sig do
    void
  end
  def test_3()
    stub_request(:get, "https://test-shop.myshopify.io/admin/api/2021-04/collection_listings/482865238.json")
      .with(
        headers: {"X-Shopify-Access-Token"=>"this_is_a_test_token", "Accept"=>"application/json"},
        body: {}
      )
      .to_return(status: 200, body: "{}", headers: {})

    ShopifyAPI::CollectionListing.find(
      session: @test_session,
      collection_id: 482865238,
    )

    assert_requested(:get, "https://test-shop.myshopify.io/admin/api/2021-04/collection_listings/482865238.json")
  end

  sig do
    void
  end
  def test_4()
    stub_request(:put, "https://test-shop.myshopify.io/admin/api/2021-04/collection_listings/482865238.json")
      .with(
        headers: {"X-Shopify-Access-Token"=>"this_is_a_test_token", "Accept"=>"application/json", "Content-Type"=>"application/json"},
        body: { "collection_listing" => hash_including({"collection_id" => 482865238}) }
      )
      .to_return(status: 200, body: "{}", headers: {})

    collection_listing = ShopifyAPI::CollectionListing.new(session: @test_session)
    collection_listing.collection_id = 482865238
    collection_listing.save()

    assert_requested(:put, "https://test-shop.myshopify.io/admin/api/2021-04/collection_listings/482865238.json")
  end

  sig do
    void
  end
  def test_5()
    stub_request(:delete, "https://test-shop.myshopify.io/admin/api/2021-04/collection_listings/482865238.json")
      .with(
        headers: {"X-Shopify-Access-Token"=>"this_is_a_test_token", "Accept"=>"application/json"},
        body: {}
      )
      .to_return(status: 200, body: "{}", headers: {})

    ShopifyAPI::CollectionListing.delete(
      session: @test_session,
      collection_id: 482865238,
    )

    assert_requested(:delete, "https://test-shop.myshopify.io/admin/api/2021-04/collection_listings/482865238.json")
  end

end