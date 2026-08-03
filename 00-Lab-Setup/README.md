00 — Lab Setup

Foundation of the IT Operations Homelab, covering virtualization, Windows Server deployment, and initial server preparation.

Overview

This section documents how the core virtual environment was designed and prepared before deploying enterprise services.

It establishes the base infrastructure used by the remaining modules, including the virtual server, Windows Server operating system, networking, security settings, updates, and administrative configuration.

Modules

Module

Purpose

01 — Enterprise Virtualization

Creates the virtual-machine environment using VMware Workstation Pro, planned hardware resources, UEFI, Secure Boot, and NAT networking.

02 — Windows Server Installation

Installs Windows Server and prepares the initial local administrator environment.

03 — Initial Server Configuration

Configures the server name, static networking, DNS settings, updates, time configuration, and initial operating-system state.

Foundation Flow

Plan the virtual infrastructure
            ↓
Create the server virtual machine
            ↓
Install Windows Server
            ↓
Configure server identity and networking
            ↓
Apply updates and security settings
            ↓
Prepare the server for enterprise services

Skills Demonstrated

VMware Workstation Pro administration

Virtual hardware planning

Windows Server installation

UEFI and Secure Boot configuration

Static IPv4 configuration

Windows Server updates

Initial server validation

Technical documentation

Environment

Component

Purpose

Windows 11 host

Runs the virtualized homelab

VMware Workstation Pro

Provides the virtualization platform

SRV01

Main Windows Server virtual machine

NAT network

Provides controlled internet connectivity

GitHub

Stores implementation guides and validation evidence

Outcome

After completing this section, the homelab has a prepared Windows Server environment ready for Active Directory Domain Services and the remaining infrastructure modules.
