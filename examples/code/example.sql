drop table if exists `indexer`.`product_attr`;

CREATE TABLE `indexer`.`product_attr` (
    `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
    `product_code` int(10) unsigned NOT NULL,
    `attr_code` int(10) unsigned NOT NULL DEFAULT '0',
    `attr_name` varchar(255) NOT NULL DEFAULT '',
    `attr_value` text NOT NULL,
    `sort` int(10) unsigned NOT NULL DEFAULT '0',
    `created` timestamp NOT NULL default CURRENT_TIMESTAMP
        on update CURRENT_TIMESTAMP,
    PRIMARY KEY  (id),
    KEY k_product_code (product_code),
) DEFAULT CHARSET=utf8;

update
    `indexer`.`product_attr` pa,
    `indexer`.`product_attr_desc` pad
set
    pa.sort = pad.sort and
    pad.display = 1
where
    pa.product_code = pad.product_code and
    pa.attr_code = pad.attr_code
;

select
    item_code,
    description
from
    `indexer`.`item`
order by
    item_code ASC
;
