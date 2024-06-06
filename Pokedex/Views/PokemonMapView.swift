import SwiftUI
import MapKit

extension Pokemon {
    var location: CLLocationCoordinate2D {
        let locationManager = CLLocationManager()
        let userLocation = locationManager.location?.coordinate ?? CLLocationCoordinate2D(latitude: 40.75773, longitude: -73.985708)
        
        let lat = userLocation.latitude + Double.random(in: -0.01...0.01)
        let lon = userLocation.longitude + Double.random(in: -0.01...0.01)
        
        return CLLocationCoordinate2D(latitude: lat, longitude: lon)
    }
}

extension Pokemon {
    func asyncImage() -> some View {
        AsyncImage(url: self.url) { pokeImage in
            pokeImage
                .resizable()
                .scaledToFit()
        } placeholder: {
            VStack {
                Image(systemName: "questionmark.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(self.color)
                    .padding()
            }
        }
    }
}

struct PokemonMapView: View {
    @State var pokemons: [Pokemon]!
    @State var selectedPokemon: Pokemon? = nil
    @State private var isShowingModal = false
    @State private var position: MapCameraPosition = .userLocation(fallback: .automatic)
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.75773, longitude: -73.985708),
        latitudinalMeters: 5000.0,
        longitudinalMeters: 5000.0
    )
    
    var body: some View {
        ZStack {
            Map(position: $position) {
                UserAnnotation()
                ForEach(pokemons) {pokemon in
                    Annotation("", coordinate: pokemon.location) {
                        pokemon
                            .asyncImage()
                            .frame(width: 40.0, height: 40.0)
                            .onTapGesture {
                                selectedPokemon = pokemon
                            }
                    }
                }
            }
            .mapControls {
                MapUserLocationButton()
                MapPitchToggle()
            }
        }
        .sheet(item: $selectedPokemon) { pokemon in
            PokemonModalView(pokemon: pokemon)
        }
        .onAppear {
            CLLocationManager().requestWhenInUseAuthorization()
        }
    }
}

#Preview {
    PokemonMapView()
}
