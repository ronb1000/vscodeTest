using DataFrames
using Query, VegaDatasets, VegaLite
cars = dataset("cars")
cars |> @select(:Acceleration,:Name)|> collect

#|> @filter(_.Origen==origen)

function foo(data,origen)
    df = data  |> DataFrame

    return df |> @vlplot(:point,:Acceleration,:Miles_per_Gallon)
end

p=foo(cars,"USA")

p |> save("foo.png")