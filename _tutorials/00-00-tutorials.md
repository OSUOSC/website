---
title: Club Tutorials
permalink: /tutorials/
---

{% assign navigation = site.data.navigation.tutorials %}
{% for nav in navigation %}
    {% if nav.url %}
      {% comment %} internal/external URL check {% endcomment %}
      {% if nav.url contains "://" %}
        {% assign domain = "" %}
      {% else %}
        {% assign domain = site.url | append: site.baseurl %}
      {% endif %}
- ### [{{ nav.title }}]({{ domain }}{{ nav.url }}")
    {% else %}
- ### {{ nav.title }}
    {% endif %}
    {% if nav.children != null %}
      {% for child in nav.children %}
        {% comment %} internal/external URL check {% endcomment %}
        {% if child.url contains "://" %}
          {% assign domain = "" %}
        {% else %}
          {% assign domain = site.url | append: site.baseurl %}
        {% endif %}
        {% comment %} set "active" class on current page {% endcomment %}
        {% if child.url == page.url %}
          {% assign active = "active" %}
        {% else %}
          {% assign active = "" %}
        {% endif %}
    - [{{ child.title }}]({{ domain }}{{ child.url }})
      {% endfor %}
    {% endif %}
{% endfor %}
