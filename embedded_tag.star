def apply(metric):
  new_metrics = {}
  common_fields = {}
  for path,value in metric.fields.items():
    if embedded_tag_path in path:
      right_path = path.split(embedded_tag_path)[1]
      tag_index = right_path[1]
      if tag_index not in new_metrics:
        new_metric = Metric(metric.name)
        new_metric.time = metric.time
        for tag_name,tag_value in metric.tags.items():
          new_metric.tags[tag_name] = tag_value
        new_metrics[tag_index] = new_metric
      renamed_key = embedded_tag_path + "/" + right_path[3:]
      new_metrics[tag_index].fields[renamed_key] = value
      if right_path[3:] == embedded_tag_name:
        new_metrics[tag_index].tags[embedded_tag_name] = value
    else:
      common_fields[path] = value
  if len(new_metrics) > 0:
    for event in new_metrics.values():
      for path,value in common_fields.items():
        event.fields[path]=value
    return new_metrics.values()
  else:
    return metric