module BuildOptsForRenderJSON
  extend self

  def call(args = {})
    http_status = args[:http_status] || :ok
    meta_hash = build_meta_hash(http_status, args)

    render_opts = {
      status: http_status,
      json: {
      # data: will go here if applicable
      },
      meta: meta_hash,
    }

    unless args[:object].nil? # NB: empty arrays and associations are not #present?
      render_opts[:json] = args[:object]
      render_opts.merge! serializer_opts(args)
    end
    render_opts.merge!({ root: 'data' })
    return render_opts
  end

  private

  def build_meta_hash(http_status, args)
    meta_hash = { http_status: Rack::Utils.status_code(http_status) }
    if args[:meta]
      meta_hash = meta_hash.merge(args[:meta])
    end
    if args[:errors].present?
      meta_hash[:errors] = args[:errors]
    end
    return meta_hash
  end

  def serializer_opts(args)
    serializer      = args[:serializer]
    each_serializer = args[:each_serializer]
    case
    when serializer.present? && each_serializer.present?
      fail ArgumentError, "There should be a serializer or an each_serializer, but not both."
    when serializer.present?
      { serializer: serializer }
    when each_serializer.present?
      { each_serializer: each_serializer }
    else
      {}
    end
  end
end
