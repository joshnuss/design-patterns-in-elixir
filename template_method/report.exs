defmodule Report do
  defmacro __using__(_) do
    quote do
      @title "Monthly Report"
      @text ["Things are going", "really really well"]

      def output_report do
        output_start
        output_head
        output_body_start
        output_lines
        output_body_end
        output_end
      end

      def output_start, do: nil
      def output_head, do: nil
      def output_body_start, do: nil

      def output_lines,
        do: Enum.each(@text, &output_line/1)

      def output_line(line),
        do: raise(ArgumentError, "not implemented")

      def output_body_end, do: nil
      def output_end, do: nil

      defoverridable output_start: 0,
                     output_head: 0,
                     output_body_start: 0,
                     output_line: 1,
                     output_body_end: 0,
                     output_end: 0
    end
  end
end
