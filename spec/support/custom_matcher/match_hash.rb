# This gives better hash comparison error message formatting.
#
# Usage:
#   expect(actual_hash).to match_hash(expected_hash)

def deep_sort(h)
  return h unless h.is_a?(Hash)
  h.sort.map do |key, value|
    [key,
      if value.is_a?(Hash)
        deep_sort(value)
      elsif value.is_a?(Array)
        value.map(&method(:deep_sort))
      else
        value
      end]
  end.to_h
end

RSpec::Matchers.define :match_hash do |expected_hash|
  match do |actual_hash|
    matching_results = actual_hash == expected_hash
    unless matching_results
      system(
        "git diff $(echo '#{JSON.pretty_generate(deep_sort(expected_hash))}' | git hash-object -w --stdin) " \
                 "$(echo '#{JSON.pretty_generate(deep_sort(actual_hash))}' | git hash-object -w --stdin) --word-diff",
        out: $stdout,
        err: :out
      )
    end
    matching_results
  end

  failure_message { "Look at the Diff above! ^^^" }
end
