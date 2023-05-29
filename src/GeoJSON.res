@unboxed
type id = String(string) | Number(float)

module Position = {
  type t = LatLng(float, float) | LatLngAlt(float, float, float)
}

module Geometry = {
  type rec t =
    | Point({coordinates: Position.t})
    | MultiPoint({coordinates: array<Position.t>})
    | LineString({coordinates: array<Position.t>})
    | MultiLineString({coordinates: array<array<Position.t>>})
    | Polygon({coordinates: array<array<Position.t>>})
    | MultiPolygon({coordinates: array<array<array<Position.t>>>})
    | GeometryCollection({geometries: array<t>})
}

module Feature = {
  type t = {geometry: Geometry.t, id?: id, properties: option<Js.Dict.t<Js.Json.t>>}
}

type t =
  | Geometry(Geometry.t)
  | Feature(Feature.t)
  | FeatureCollection({features: array<Feature.t>})
