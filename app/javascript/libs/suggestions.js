import 'suggestions-jquery';
import jquery from 'jquery';

window.$ = jquery;

$(() => {
    const $addrLat = $('#addr-lat');
    const $addrLong = $('#addr-long');

    $('#addr-suggestions').suggestions(
        {
            token: '8aaa545393f936c8af2610ff822e20e9c7671b26',
            type: 'ADDRESS',
            triggerSelectOnBlur: true,
            onSelect: (suggestion) => {
                const {geo_lat, geo_lon} = suggestion.data;
                $addrLat.val(geo_lat);
                $addrLong.val(geo_lon);
            }
        }
    );
});
