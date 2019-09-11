create database meetup;
use meetup;

add jars /usr/lib/hive-hcatalog/share/hcatalog/hive-hcatalog-core-1.1.0-cdh5.13.0.jar;
list jars;

drop table meetup;
CREATE EXTERNAL TABLE meetup (

    venue struct<
    venue_name: string,
    lat: double,
    lon: double,
    venue_id: string>,

    member struct<
    member_id: string,
    member_name: string,
    photo: string,
    other_services: struct<service: struct<identifier:string>>>,
    
    event struct<
    event_id: string,
    event_name: string,
    event_url: string,
    time: bigint>,
    
    group struct<
    group_city: string,
    group_country: string,
    group_id: string,
    group_lat: double,
    group_lon: double,
    group_name: string,
    group_state: string,
    group_topics: ARRAY<STRUCT<
        topic_name: string,
        urlkey: string>>>,
    
    guests int,
    mtime bigint,
    response string,
    rsvp_id string
)

ROW FORMAT SERDE 'org.apache.hive.hcatalog.data.JsonSerDe'
LOCATION '/tmp/meetup';

select venue.venue_name, venue.lat , venue.lon from meetup 
where venue.venue_name is not null limit 10;
