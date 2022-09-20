////
////  FlightsDataBaseStorage.swift
////  TMS
////
////  Created by Rastsislau Yurevich on 20/09/2022.
////
//
//import Foundation
//import CoreData
//
//struct FlightsDataBaseStorage {
//    
//    private let context = AppDataController.shared.context
//    
//    func save(model: TicketModel) {
//        
//    }
//    
//    func editTicket(by id: UUID) {
//        
//    }
//    
//    
//    func fetchTicketModel() {
//        
//    }
//    
//    
//    func fetchAllTickets() {
//        context.perform {
//            let fetchRequest = TicketModel.fetchRequest() as! NSFetchRequest<TicketModel>
//                
//            let model = try! context.fetch(<#T##request: NSFetchRequest<NSFetchRequestResult>##NSFetchRequest<NSFetchRequestResult>#>)
//        }
//    }
//    
//    
//    func removeAll() {
//        
//    }
//    
//    func removeTicket(by id: UUID) {
//        
//    }
//}
