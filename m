Return-Path: <linux-clk+bounces-15195-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 374E89E0053
	for <lists+linux-clk@lfdr.de>; Mon,  2 Dec 2024 12:27:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64C98161AFA
	for <lists+linux-clk@lfdr.de>; Mon,  2 Dec 2024 11:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58601200132;
	Mon,  2 Dec 2024 11:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TXu+Y0bo"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001F422301
	for <linux-clk@vger.kernel.org>; Mon,  2 Dec 2024 11:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733138347; cv=none; b=CRnSeDLfcF43jMjpt3pgPYnR9FJ0c35Qe7H0bfTew6qfPBXmTkVz+nrxYd3zorecvf7VkKLIG7zttANeiINFnIoOCNSKl/cRTh4a5TW8QD5u5Yb5HUl5sl1NZj3YXUTIG78a12jLjQnxacejwWMbxnq8i/QukBK1WeudWnokHnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733138347; c=relaxed/simple;
	bh=uCQAgYJ6+Mc+JfRJ9hb9AD/dXQ/2I9Ya9X92PLE+rv4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=pPa2Qfpc9LRKGDEmcFLWPBJBtGcdmuL7y8hY/kH8YUgghwzAfZo2rRzC/yAk7KkeI63Hw57/HRQ9QlFWI6N6BIBAfv6O+YfoIHCBRCLlwbBK12/U4AB7p0AjrQJR3twHvK0Z1mMmpmlfXGaCbBikZCI6CsePDwSTq5HMMOBLT9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TXu+Y0bo; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-a9ec267b879so665727066b.2
        for <linux-clk@vger.kernel.org>; Mon, 02 Dec 2024 03:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733138343; x=1733743143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gjHlwSiznG7ZMzHVL1AbaIvEmzPENJ2D8a0GdBICd5U=;
        b=TXu+Y0bolKfe6SMv8VBE4+Tr1REpZgemdQnddEfgtX8TNnsmT8zpxnbF6849gOTDUQ
         dZwlHbiRhZc+Dt/ns+DUamxgEXNNycl2AERaEszXt+R2eOL93ubajPS2IEUYE59GB1/w
         AFDEye1nJfIHmuymBl9Jzjsp0p6QPe5Ani1IUbq2GF8GEb8uxrbD7hFsaNw62zRXPPkU
         EWD/rMQ931QAUM9Oe3ezbVIDC8MPtzo+RqUem9Po1mkLQflVFWbX+KBBpJ6M3mnkZBK2
         HhM4bfJaZARxdoNrtcgfy+i7LlwRHbIz4bhMz/pv9Zcla4Kv5A69VCtWqfj0g44yTqaV
         hSZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733138343; x=1733743143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gjHlwSiznG7ZMzHVL1AbaIvEmzPENJ2D8a0GdBICd5U=;
        b=AzybnnaJPP4WdZXBwqlWNwn1g1ZH83kYPvF2dAXP/ZaMIWV1r5RZhLlKRrG5tz2Kl5
         TDLzUysU+OyuosWh3yJLDXASFYbRxPxWyMHLP9jjQ+qlVeYqhOcRsytEj963isX8z7Yg
         cOiw++dvYkn+VhMQoNwM6RbJnaS3VhHoZLHDIoe1bjiyf6Gu3RbnVNhC0UlUMUa/zkRk
         h+YAlQvthazpZzMgP+A5UrMGNsZBVuaVLVEgzFyVBw4hzIxDOCwlzUzaHmnanWCIv4IF
         x6D+luoPYlLH5GggOPOAn93emIsIVlieoLcJc4e/iHy2mFHYXXy5kUYOhESEEKtAQHB0
         CCVg==
X-Forwarded-Encrypted: i=1; AJvYcCVndADInJbK6VUjSIQERNhiU/Z+Y6gpr51Ge/+rEfqriQhWzcj59tGDixWjwANSo3jnrP4YalLMrfE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2ZoHQV+P/kYKBiffQNnbr7odYoe0LiyeYRbZ1EbR74T7gc1GO
	YLJtsheBOGWVTKrWdvGFWXRqvXY7+MQLgnXp2sR0zsBdST97veXvzDWCtvOBdus=
X-Gm-Gg: ASbGncuecnmEFaTieAGkS53qt+zUNCMJM9XI0YbUnrZozZRMbBbSVsCmnm6DTc2ODrJ
	0aZwgSPu+zExLF6V9D8Zwman7C+Lj8n5Xx3Qa6rVuq7+1rSr3fPmjDLoAvRAw5MoUEBDVRF2aSJ
	mbKZG+YVgj23Xkui5CRDRtRAnE/LUi4Rgj9QdDGxsk2zQDnMpSKr+uBckOFY5Bn6eNK0oRuShTc
	4m5apnpnprS37CASkJqmb84M3NShnC2mcK3xQfln6Zep+EWPTclYmqRVtle8bBAjNobp3b8LNHt
	OZfsmaurRBdHAGDKgq4B
X-Google-Smtp-Source: AGHT+IEs4gB+Ysjlt8eU17nb3Ci2yczcmJ4H3W58u7P8uDa3tV/VvmLR86S0tSbUkR8W6jLjqNnUhQ==
X-Received: by 2002:a17:906:32c3:b0:aa5:449e:1a1d with SMTP id a640c23a62f3a-aa580edd946mr1994683366b.2.1733138343233;
        Mon, 02 Dec 2024 03:19:03 -0800 (PST)
Received: from localhost (host-87-20-211-251.retail.telecomitalia.it. [87.20.211.251])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996dbee1sm496958166b.45.2024.12.02.03.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 03:19:02 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v5 00/10] Add support for RaspberryPi RP1 PCI device using a DT overlay
Date: Mon,  2 Dec 2024 12:19:24 +0100
Message-ID: <cover.1733136811.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RP1 is an MFD chipset that acts as a south-bridge PCIe endpoint sporting
a pletora of subdevices (i.e.  Ethernet, USB host controller, I2C, PWM,
etc.) whose registers are all reachable starting from an offset from the
BAR address.  The main point here is that while the RP1 as an endpoint
itself is discoverable via usual PCI enumeraiton, the devices it contains
are not discoverable and must be declared e.g. via the devicetree.

This patchset is an attempt to provide a minimum infrastructure to allow
the RP1 chipset to be discovered and perpherals it contains to be added
from a devictree overlay loaded during RP1 PCI endpoint enumeration.
Followup patches should add support for the several peripherals contained
in RP1.

This work is based upon dowstream drivers code and the proposal from RH
et al. (see [1] and [2]). A similar approach is also pursued in [3].

The patches are ordered as follows:

-PATCHES 1 to 4: add binding schemas for clock, gpio and RP1 peripherals.
 They are needed to support the other peripherals, e.g. the ethernet mac
 depends on a clock generated by RP1 and the phy is reset though the
 on-board gpio controller.

-PATCH 5 and 6: add clock and gpio device drivers.

-PATCH 7: the devicetree overlay describing the RP1 chipset. Please
 note that this patch should be taken by the same maintainer that will
 also take patch 11, since txeieh dtso is compiled in as binary blob and is
 closely coupled to the driver.

-PATCH 8: this is the main patch to support RP1 chipset and peripherals
 enabling through dtb overlay. The dtso since is intimately coupled with
 the driver and will be linked in as binary blob in the driver obj.
 The real dtso is in devicetree folder while the dtso in driver folder is
 just a placeholder to include the real dtso.
 In this way it is possible to check the dtso against dt-bindings.
 The reason why drivers/misc has been selected as containing folder
 for this driver can be seen in [6], [7] and [8].

-PATCH 9: add the external clock node (used by RP1) to the main dts.

-PATCH 10: add the relevant kernel CONFIG_ options to defconfig.

This patchset is also a first attempt to be more agnostic wrt hardware
description standards such as OF devicetree and ACPI, where 'agnostic'
means "using DT in coexistence with ACPI", as been already promoted
by e.g. AL (see [4]). Although there's currently no evidence it will also
run out of the box on purely ACPI system, it is a first step towards
that direction.

Please note that albeit this patchset has no prerequisites in order to
be applied cleanly, it still depends on Stanimir's WIP patchset for BCM2712
PCIe controller (see [5]) in order to work at runtime.

Many thanks,
Andrea della Porta

Links:
- [1]: https://lpc.events/event/17/contributions/1421/attachments/1337/2680/LPC2023%20Non-discoverable%20devices%20in%20PCI.pdf
- [2]: https://lore.kernel.org/lkml/20230419231155.GA899497-robh@kernel.org/t/
- [3]: https://lore.kernel.org/all/20240808154658.247873-1-herve.codina@bootlin.com/#t
- [4]: https://lore.kernel.org/all/73e05c77-6d53-4aae-95ac-415456ff0ae4@lunn.ch/
- [5]: https://lore.kernel.org/all/20240626104544.14233-1-svarbanov@suse.de/
- [6]: https://lore.kernel.org/all/20240612140208.GC1504919@google.com/
- [7]: https://lore.kernel.org/all/83f7fa09-d0e6-4f36-a27d-cee08979be2a@app.fastmail.com/
- [8]: https://lore.kernel.org/all/2024081356-mutable-everyday-6f9d@gregkh/


CHANGES IN V5:

PATCH RELATED -------------------------------------------------

- patch 1 and 2: added: 'Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>'

- patch 6 and 10: added 'Reviewed-by: Stefan Wahren <wahrenst@gmx.net>'

- rebased on v6.13-rc1


KCONFIG -----------------------------------------

- drivers/misc/rp1/Kconfig: leading spaces converted to tab


RP1 MISC DRIVER -----------------------------------

- added a comment to describe ovcs_id field from struct rp1_dev

- added braces around a single line if statement followed by a braced
  else condition

- removed a double space character


GPIO/PINCTRL --------------------------------------

- moved a multiplication (*) sign to the line it belongs to (code style
  fixup)


DTS -----------------------------------------

- Moved clk_rp1_xosc from SoC DTS to board DTS


BINDINGS ------------------------------------

- pci1de4,1.yaml: adjusted ranges and reg properties in the example
  to better reflect the address from RP1 documentation. These refelcts
  the same convention used in the dtso

- raspberrypi,rp1-gpio.yaml: fixed 'pins' pattern to go at most up to 53

- raspberrypi,rp1-gpio.yaml: using single quotes consistently over double
  quotes

- raspberrypi,rp1-gpio.yaml: added some pin config option supported by the
  hw/driver but missing in the schema


Andrea della Porta (10):
  dt-bindings: clock: Add RaspberryPi RP1 clock bindings
  dt-bindings: pinctrl: Add RaspberryPi RP1 gpio/pinctrl/pinmux bindings
  dt-bindings: pci: Add common schema for devices accessible through PCI
    BARs
  dt-bindings: misc: Add device specific bindings for RaspberryPi RP1
  clk: rp1: Add support for clocks provided by RP1
  pinctrl: rp1: Implement RaspberryPi RP1 gpio support
  arm64: dts: rp1: Add support for RaspberryPi's RP1 device
  misc: rp1: RaspberryPi RP1 misc driver
  arm64: dts: bcm2712: Add external clock for RP1 chipset on Rpi5
  arm64: defconfig: Enable RP1 misc/clock/gpio drivers

 .../clock/raspberrypi,rp1-clocks.yaml         |   58 +
 .../devicetree/bindings/misc/pci1de4,1.yaml   |   73 +
 .../devicetree/bindings/pci/pci-ep-bus.yaml   |   58 +
 .../pinctrl/raspberrypi,rp1-gpio.yaml         |  198 +++
 MAINTAINERS                                   |   14 +
 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     |    7 +
 arch/arm64/boot/dts/broadcom/rp1.dtso         |   58 +
 arch/arm64/configs/defconfig                  |    3 +
 drivers/clk/Kconfig                           |    9 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/clk-rp1.c                         | 1527 +++++++++++++++++
 drivers/misc/Kconfig                          |    1 +
 drivers/misc/Makefile                         |    1 +
 drivers/misc/rp1/Kconfig                      |   21 +
 drivers/misc/rp1/Makefile                     |    3 +
 drivers/misc/rp1/rp1-pci.dtso                 |    8 +
 drivers/misc/rp1/rp1_pci.c                    |  366 ++++
 drivers/misc/rp1/rp1_pci.h                    |   14 +
 drivers/pci/quirks.c                          |    1 +
 drivers/pinctrl/Kconfig                       |   11 +
 drivers/pinctrl/Makefile                      |    1 +
 drivers/pinctrl/pinctrl-rp1.c                 |  789 +++++++++
 .../clock/raspberrypi,rp1-clocks.h            |   61 +
 include/linux/pci_ids.h                       |    3 +
 24 files changed, 3286 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/raspberrypi,rp1-clocks.yaml
 create mode 100644 Documentation/devicetree/bindings/misc/pci1de4,1.yaml
 create mode 100644 Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
 create mode 100644 arch/arm64/boot/dts/broadcom/rp1.dtso
 create mode 100644 drivers/clk/clk-rp1.c
 create mode 100644 drivers/misc/rp1/Kconfig
 create mode 100644 drivers/misc/rp1/Makefile
 create mode 100644 drivers/misc/rp1/rp1-pci.dtso
 create mode 100644 drivers/misc/rp1/rp1_pci.c
 create mode 100644 drivers/misc/rp1/rp1_pci.h
 create mode 100644 drivers/pinctrl/pinctrl-rp1.c
 create mode 100644 include/dt-bindings/clock/raspberrypi,rp1-clocks.h

-- 
2.35.3


