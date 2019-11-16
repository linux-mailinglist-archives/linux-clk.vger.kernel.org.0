Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE443FF4CE
	for <lists+linux-clk@lfdr.de>; Sat, 16 Nov 2019 19:55:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727750AbfKPSzk (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 16 Nov 2019 13:55:40 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:34238 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727720AbfKPSzj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 16 Nov 2019 13:55:39 -0500
Received: by mail-lf1-f68.google.com with SMTP id l28so1082153lfj.1;
        Sat, 16 Nov 2019 10:55:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=1jfHydbKQAVtDc9rB7jdObuleF9wI/wxnKKLR7L8H6Q=;
        b=CTXD8UpkpT6absfteQyFVOXG9+LUtGjZQKKyp+7ba0B/lmyAE29WUwTOaM17v5sJ+t
         Y3bDM3cyrsaZNGeLHqylgAa9XvZB/Oec7NhgmseBv1NuggAK7z04EiypJeIeZrrBORzE
         boiXcta7bZqJVnn0s7YQAUsrwKO8MeZmJV8HlALrKDb/QYJhzppl317jFJEdal6x83Yd
         9XBMVslps9/b/TwTNiWm37bg/eLCHWOUrzMsS5+Z2zCGE2lm5vjyf8llLI7Fz8JdaRdU
         9jCOO+n0eVmxztLZFlvwg3+u+JHkFtYczdgZw8SNZjnqoAWXTFjsfLHw6uD3pvb5zA1g
         wQLw==
X-Gm-Message-State: APjAAAWks9ezonxQM5GbmDna2Y6F5C8xWB4QG1S0xZpVO4keRWg1YvX8
        V+b5EbMHGEqF3iJZPqYcmbE=
X-Google-Smtp-Source: APXvYqxwQtbbEvxyxKY9cxDGsLwn3vsL2l8WV+R6N8T8NeGGpawVRhIQF1nPFSqdpOhA0ovyKJCZwA==
X-Received: by 2002:a19:651b:: with SMTP id z27mr15108580lfb.117.1573930534499;
        Sat, 16 Nov 2019 10:55:34 -0800 (PST)
Received: from localhost.localdomain (dyttqz39y2bkc1ryvyh3t-4.rev.dnainternet.fi. [2001:14bb:420:da5f:a0b0:502a:b811:1af])
        by smtp.gmail.com with ESMTPSA id m62sm6700005lfa.10.2019.11.16.10.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2019 10:55:33 -0800 (PST)
Date:   Sat, 16 Nov 2019 20:55:23 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Nicholas Mc Guire <hofrat@osadl.org>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: [PATCH v4 00/16] Support ROHM BD71828 PMIC
Message-ID: <cover.1573928775.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Patch series introducing support for ROHM BD71828 PMIC

ROHM BD71828 is a power management IC containing 7 bucks and 7 LDOs. All
regulators can either be controlled individually via I2C. Bucks 1,2,6 and
7 can also be assigned to a "regulator group" controlled by run-levels.
Eg. Run level specific voltages and enable/disable statuses for each of
these bucks can be set via register interface. The buck run-level group
assignment (selection if buck is to be controlled individually or via
run-levels) can be changed at run-time via I2C.

Run level changes can then be initiated wither via I2C writes or GPIO.
and when run-level is changed, state of all bucks which are set to be
controlled via run-levels are changed accrdingly.

This control mechanism selection (I2C or GPIO) is selected by data in
one time programmable PMIC memory area (during production) and can't be
changed later.

In addition to the bucks and LDOs there are:

- The usual clk gate
- 4 IO pins (mostly usable as GPO or tied to specific purpose)
- power button support
- RTC
- two LEDs
- battery charger
- HALL sensor input

This patch series adds support to regulators, clk, RTC, GPIOs and LEDs.

Power-supply driver for charger is "under construction" and not included
in this series.

The series also adds LED DT-node lookup based on node name or given
property name/value pair in LED core. It also adds generic default-state
and default-trigger property handling to LED core. Follow-up patches
simplifying few other LED drivers should follow.

In GPIO framework this series adds devm-support for gpio_array getting
for MFD sub-devices whose GPIO consumer information may be in parent
device's DT node. And while I was at it I also added few missing GPIO devm
functions to the documentaton listing.

Changelog v4 (first non RFC):
  General:
    - Changed subdevice loading and chip version identification to use
      platform ID.
    - License identifiers changed to GPL-2.0-only
  MFD:
    - Styling fixes mostly
  DT-Bindings:
    - a few more checks as suggested by Rob Herring.
    - Order of DT patches changed.
    - me as maintainer
    - standard units to new properties (microvolts, ohms)
    - runlevel values in an array
  LED:
    - BD71828 driver added (back)
      - Added DT support
    - Added LED DT node lookup in led framework when init_data is given
      with DT node match information.
    - Added common property parsing for default-state and
      default-trigger.
  Regulators:
    - dropped sysfs interfaces
    - fixed module unload/reload by binding gpio consumer information to
      regulator device not to MFD.
  GPIO:
    - Added devm_gpiod_get_parent_array
    - added few missing devm functions to documentation

Changelog v3:
  DT-Bindings:
    - yamlify
    - add LED binding doc
  CLK:
    - Move clk register definitions from MFD headers to clk driver
  GPIO:
    - Add generic direction define and use it.
  LED:
    - Drop LED driver from the series (for now).

Changelog v2: Mainly RTC and GPIO fixes suggested by Alexandre and Bartosz
  General:
    -Patch ordering changed to provide dt binding documents right after the
     MFD core.
  DT-Bindings for regulators (Patch 3)
    -Fix typo in PMIC model number
  RTC (patch 11)
    -Reverted renaming in order to reduce patch size.
    -Reworded commit message
  BD71828 regulator (patch 7)
    -Add MODULE_ALIAS
  GPIO (patch 12)
    -Remove file-name from comment
    -prefix IN and OUT defines with chip type
    -improved documentation for the INPUT only pin.
    -removed empty left-over function
    -removed unnecessary #ifdef CONFIG_OF_GPIO
    -removed unnecessary error print
    -Add MODULE_ALIAS

Patch 1:
        dt-bindings for regulators on BD71828 PMIC
Patch 2:
        dt-bindings for LEDs on BD71828 PMIC
Patch 3:
	dt-bindings for BD71828 PMIC
Patch 4:
	Convert rohm PMICs with common sub-devices to use platform_
	device_id to match MFD sub-devices
Patch 5:
        BD71828 MFD core.
Patch 6:
	Power button support using GPIO keys.
Patch 7:
        CLK gate support using existing clk-bd718x7
Patch 8:
        Split existing bd718x7 regulator driver to generic ROHM dt
        parsing portion (used by more than one ROHM drivers) and
        bd718x8 specific parts
Patch 9:
        Basic regulator support (individual control via I2C). This
        should be pretty standard stuff.
Patch 10:
	Add devm_gpiod_get_parent_array
Patch 11:
	Add missing managed GPIO array get functions to documentation
Patch 12:
        Add support for getting regulator voltages when run-levels are
	used. Allow specifying voltages for run-levels via DT and
	in-kernel API. Support changing run-levels via in-kernel API.
Patch 13:
        Support BD71828 RTC block using BD70528 RTC driver
Patch 14:
        Allow control of GP(I)O pins on BD71828 via GPIO subsystem
Patch 15:
	Add LED node lookup and common LED binding parsing support
	to LED class/core
Patch 16:
        Support toggling the LEDs on BD71828.

This patch series is based on v5.4-rc7

---

Matti Vaittinen (16):
  dt-bindings: regulator: Document ROHM BD71282 regulator bindings
  dt-bindings: leds: ROHM BD71282 PMIC LED driver
  dt-bindings: mfd: Document ROHM BD71828 bindings
  mfd: rohm PMICs - use platform_device_id to match MFD sub-devices
  mfd: bd71828: Support ROHM BD71828 PMIC - core
  mfd: input: bd71828: Add power-key support
  clk: bd718x7: Support ROHM BD71828 clk block
  regulator: bd718x7: Split driver to common and bd718x7 specific parts
  regulator: bd71828: Basic support for ROHM bd71828 PMIC regulators
  gpio: devres: Add devm_gpiod_get_parent_array
  docs: driver-model: Add missing managed GPIO array get functions
  regulator: bd71828: Add GPIO based run-level control for regulators
  rtc: bd70528 add BD71828 support
  gpio: bd71828: Initial support for ROHM BD71828 PMIC GPIOs
  leds: Add common LED binding parsing support to LED class/core
  led: bd71828: Support LED outputs on ROHM BD71828 PMIC

 .../bindings/leds/rohm,bd71828-leds.yaml      |   49 +
 .../bindings/mfd/rohm,bd71828-pmic.yaml       |  249 +++
 .../regulator/rohm,bd71828-regulator.yaml     |  122 ++
 .../driver-api/driver-model/devres.rst        |    3 +
 drivers/clk/Kconfig                           |    6 +-
 drivers/clk/clk-bd718x7.c                     |   50 +-
 drivers/gpio/Kconfig                          |   12 +
 drivers/gpio/Makefile                         |    1 +
 drivers/gpio/gpio-bd71828.c                   |  159 ++
 drivers/gpio/gpiolib-devres.c                 |   65 +-
 drivers/leds/Kconfig                          |   10 +
 drivers/leds/Makefile                         |    1 +
 drivers/leds/led-class.c                      |   88 +-
 drivers/leds/led-core.c                       |  246 ++-
 drivers/leds/leds-bd71828.c                   |  104 ++
 drivers/mfd/Kconfig                           |   15 +
 drivers/mfd/Makefile                          |    2 +-
 drivers/mfd/rohm-bd70528.c                    |    3 +-
 drivers/mfd/rohm-bd71828.c                    |  345 +++++
 drivers/mfd/rohm-bd718x7.c                    |   39 +-
 drivers/regulator/Kconfig                     |   16 +
 drivers/regulator/Makefile                    |    2 +
 drivers/regulator/bd71828-regulator.c         | 1374 +++++++++++++++++
 drivers/regulator/bd718x7-regulator.c         |  200 +--
 drivers/regulator/rohm-regulator.c            |   95 ++
 drivers/rtc/Kconfig                           |    3 +-
 drivers/rtc/rtc-bd70528.c                     |  167 +-
 include/linux/gpio/consumer.h                 |    5 +
 include/linux/leds.h                          |   90 +-
 include/linux/mfd/rohm-bd70528.h              |   19 +-
 include/linux/mfd/rohm-bd71828.h              |  428 +++++
 include/linux/mfd/rohm-bd718x7.h              |    6 -
 include/linux/mfd/rohm-generic.h              |   48 +-
 include/linux/mfd/rohm-shared.h               |   27 +
 34 files changed, 3772 insertions(+), 277 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/rohm,bd71828-leds.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd71828-regulator.yaml
 create mode 100644 drivers/gpio/gpio-bd71828.c
 create mode 100644 drivers/leds/leds-bd71828.c
 create mode 100644 drivers/mfd/rohm-bd71828.c
 create mode 100644 drivers/regulator/bd71828-regulator.c
 create mode 100644 drivers/regulator/rohm-regulator.c
 create mode 100644 include/linux/mfd/rohm-bd71828.h
 create mode 100644 include/linux/mfd/rohm-shared.h


base-commit: 31f4f5b495a62c9a8b15b1c3581acd5efeb9af8c
-- 
2.21.0


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
