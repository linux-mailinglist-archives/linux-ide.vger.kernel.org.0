Return-Path: <linux-ide-owner@vger.kernel.org>
X-Original-To: lists+linux-ide@lfdr.de
Delivered-To: lists+linux-ide@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8119B3416D6
	for <lists+linux-ide@lfdr.de>; Fri, 19 Mar 2021 08:46:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234076AbhCSHqN convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-ide@lfdr.de>); Fri, 19 Mar 2021 03:46:13 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:41605 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234016AbhCSHpt (ORCPT
        <rfc822;linux-ide@vger.kernel.org>); Fri, 19 Mar 2021 03:45:49 -0400
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 18CA63BCB1C;
        Fri, 19 Mar 2021 07:26:27 +0000 (UTC)
X-Originating-IP: 90.66.176.191
Received: from localhost (lfbn-lyo-1-2007-191.w90-66.abo.wanadoo.fr [90.66.176.191])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 3D615C0008;
        Fri, 19 Mar 2021 07:26:01 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Sven Auhagen <sven.auhagen@voleatech.de>, axboe@kernel.dk,
        hdegoede@redhat.com, robh+dt@kernel.org, tglx@linutronix.de,
        maz@kernel.org
Cc:     linux-ide@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, jason@lakedaemon.net, andrew@lunn.ch,
        rjw@rjwysocki.net, viresh.kumar@linaro.org,
        antoine.tenart@bootlin.com, maxime.chevallier@bootlin.com,
        thomas.petazzoni@bootlin.com, miquel.raynal@bootlin.com
Subject: Re: [PATCH v3 0/9] Armada8k enable per-port SATA interrupts and
 drop a hack in the IRQ subsystem
In-Reply-To: <20210227105723.7i42cw376qmnozcp@SvensMacBookAir-2.local>
References: <20201109173948.96663-1-sven.auhagen@voleatech.de>
 <20210227105723.7i42cw376qmnozcp@SvensMacBookAir-2.local>
Date:   Fri, 19 Mar 2021 08:26:00 +0100
Message-ID: <87h7l7iozb.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-ide.vger.kernel.org>
X-Mailing-List: linux-ide@vger.kernel.org

Hello Sven,

> Hello,
>
> can I ask about the status of this patch?
> As far as I can tell it was not merged to ata and I did not receive
> any further feedback that there was a problem with the patch series.
>
> As a matter of fact the device tree part was already merged by
> Gregory Clement.

As the maintainer of the ahci subsytem reviewed the series, I really
expected that he merged it, so me neither I don't understand what
happened.

Hans,

is there still anything wrong that prevent you applying the series ?

Grégory


>
> Best and thanks
> Sven
>
> On Mon, Nov 09, 2020 at 06:39:39PM +0100, sven.auhagen@voleatech.de wrote:
>> From: Sven Auhagen <sven.auhagen@voleatech.de>
>> 
>> Hello, 
>> 
>> There were already 4 versions of this series from Miquèl.
>> I talked to Miquèl and I fixed up the last comments from v4.
>> I am looking for feedback if this patch series is now ready to be merged
>> and what should be further changed.
>> 
>> Here is the original cover letter:
>> 
>> Some time ago, when the initial support for Armada CP110 was
>> contributed, the SATA core was not able to handle per-port
>> interrupts. Despite the hardware reality, the device tree only
>> represents one main interrupt for the two ports. Having both SATA
>> ports enabled at the same time has been achieved by a hack in the ICU
>> driver(1) that faked the use of the two interrupts, no matter which
>> SATA port was in use.
>> 
>> Now that the SATA core is ready to handle more than one interrupt,
>> this series adds support for it in the libahci_platform code. The
>> CP110 device tree must be updated to reflect the two SATA ports
>> available and their respective interrupts. To do not break DT backward
>> compatibility, the ahci_platform driver now embeds a special quirk
>> which checks if the DT is valid (only for A8k compatible) and, if
>> needed, creates the two missing sub-nodes, and assign them the
>> relevant "reg" and "interrupts" properties, before removing the main
>> SATA node "interrupts" one.
>> 
>> (1) The ICU is an irqchip aggregating the CP110 (south-bridge)
>> interrupts into MSIs for the AP806 (north-bridge).
>> 
>> Best
>> Sven
>> 
>> Change from v2:
>>   * Fix commit message of custom irq init for host init
>> 
>> Change from v1:
>>   * Add a patch to enable custom irq initialization in 
>>     plattform init host
>>   * Add multi_irq_host_ack callback for the msi irq handler
>>   * Rework the ahci mvebu patch to initiate the irq and use
>>     the new multi_irq_host_ack to handle the custom irq code.
>>     Remove the custom irq handler and duplicate code.
>>   * Fix the armada8k backwards compatibility code
>>   * Rename AHCI_PLATFORM_A8K_QUIRK to AHCI_PLATFORM_ARMADA8K_QUIRK
>> 
>> Miquel Raynal (5):
>>   ata: ahci: mvebu: Rename a platform data flag
>>   ata: ahci: mvebu: Support A8k compatible
>>   irqchip/irq-mvebu-icu: Remove the double SATA ports interrupt hack
>>   dt-bindings: ata: Update ahci bindings with possible per-port
>>     interrupts
>>   dt-bindings: ata: Update ahci_mvebu bindings
>> 
>> Sven Auhagen (4):
>>   ata: libahci_platform: Do not try to get an IRQ when
>>     AHCI_HFLAG_MULTI_MSI is set
>>   ata: ahci: add ack callback to multi irq handler
>>   ata: ahci: mvebu: Add support for A8k legacy DT bindings
>>   arm64: dts: marvell: armada-cp110: Switch to per-port SATA interrupts
>> 
>>  .../devicetree/bindings/ata/ahci-platform.txt |   7 +
>>  arch/arm64/boot/dts/marvell/armada-cp11x.dtsi |   6 +-
>>  drivers/ata/ahci.h                            |   2 +
>>  drivers/ata/ahci_mvebu.c                      | 143 ++++++++++++++++--
>>  drivers/ata/libahci.c                         |   4 +
>>  drivers/ata/libahci_platform.c                |  19 ++-
>>  drivers/irqchip/irq-mvebu-icu.c               |  18 ---
>>  include/linux/ahci_platform.h                 |   1 +
>>  8 files changed, 160 insertions(+), 40 deletions(-)
>> 
>> -- 
>> 2.20.1
>> 
>> 

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
