defmodule Formatter do
  @callback output_report(context :: map) :: nil
end
