//
//  ViewController.swift
//  PhotoPicker
//
//  Created by Максим Вильданов on 11.03.2018.
//  Copyright © 2018 Максим Вильданов. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var takePhoto: UIButton!
    @IBOutlet weak var camPreview: UIView!
    
    let captureSessions = AVCaptureSession()
    var previewLayer: AVCaptureVideoPreviewLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSession()
        setupPreview()
        startSession()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func sharingPhoto(_ sender: UIButton) {
        guard let sharingPhoto = imageView.image else {return}
        
        let activityViewController = UIActivityViewController(activityItems: [sharingPhoto], applicationActivities: nil)
        present(activityViewController,animated: true, completion: nil)
    }
    
    @IBAction func takePhoto(_ sender: UIButton) {
        let imagePick = UIImagePickerController()
        imagePick.delegate = self
        imagePick.sourceType = .camera
        imagePick.allowsEditing = true
        
        present(imagePick, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] {
            imageView.image = image as? UIImage
            picker.dismiss(animated: true, completion: nil)
            
        }
    }
    
    func setupSession() {
        
        captureSessions.sessionPreset = AVCaptureSession.Preset.high
        let camera = AVCaptureDevice.default(for: AVMediaType.video)
        
        do {
            let input = try AVCaptureDeviceInput(device: camera!)
            if captureSessions.canAddInput(input) {
                captureSessions.addInput(input)
            }
        } catch {
            print("Ошибка подключения камеры: \(error)")
        }
        
        let microphone = AVCaptureDevice.default(for: AVMediaType.audio)
        
        do {
            let input = try AVCaptureDeviceInput(device: microphone!)
            if captureSessions.canAddInput(micInput) {
                captureSessions.addInput(micInput)
            }
        } catch {
            print("Ошибка подключения микрофона: \(error)")
        }
    }
    
    func setupPreview() {
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSessions)
        previewLayer.frame = camPreview.bounds
        previewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        camPreview.layer.addSublayer(previewLayer)
    }
    
    func videoQueue() -> DispatchQueue {
        return DispatchQueue.global(qos: DispatchQoS.QoSClass.default)
    }
    func startSession() {
        if !captureSessions.isRunning {
            videoQueue().async {
                self.captureSessions.stopRunning()
                    
                }
            }
        }
    
    func stopSession() {
        if captureSessions.isRunning {
            videoQueue().async {
                self.captureSessions.stopRunning()
            }
        }
    }
    
    deinit {
        stopSession()
    }
    
    }
    


