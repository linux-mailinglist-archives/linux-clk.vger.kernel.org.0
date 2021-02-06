Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2061C3118E7
	for <lists+linux-clk@lfdr.de>; Sat,  6 Feb 2021 03:51:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231939AbhBFCt0 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 5 Feb 2021 21:49:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229808AbhBFCbw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 Feb 2021 21:31:52 -0500
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94346C0698D6
        for <linux-clk@vger.kernel.org>; Fri,  5 Feb 2021 14:26:48 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id 11so8753259ybl.21
        for <linux-clk@vger.kernel.org>; Fri, 05 Feb 2021 14:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=KekFTcOSO4wGAzjYFoTwyn8B3aXY0kSnpBZiIzqgZEQ=;
        b=KrQzTpS6DEL/LCcOb464QcY63wZdOZyXEce3rYox0e/nGOQdvy7laJJKstqsB2NyjQ
         jZtp7noJv+D3j5LbRhVy96dSNljsXiOTyrCUGWuv/JSD+bIejeLKNXrqbCgwGBilJi/2
         oEE561HncfQrVH5rGAj5pGzI1tXoAZtO4SAMKijao3R8oTf7rdFdA9z7kIg92gEcYLot
         ttNIT/yBpvW8eS4kR4/f06jsFYlGYoifws72E7669fzKMKYIaENiMi5Hb5K5PIq+F9G8
         IrKDlnWLqO6ClP2GHCwNFAX6wO37RQwoYo0d7cl1yi7luH1HtnqO+4m85WADDz8irR7V
         biTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=KekFTcOSO4wGAzjYFoTwyn8B3aXY0kSnpBZiIzqgZEQ=;
        b=YFaDLFnIrcazBQalfkINoQGchUylpRf28JsykhU9KgVZNtFS9+eiKrcJnQ7hfaOy4a
         wU6gaFB0nnsrIPdU4miiC6eyDu2qHO4ahZkekucVdTZsACPPkB8vyElOTU0NXN6NGfH+
         X02dywJmvmpBk1OVJ/agukyC46GCv4swUHYdDNDWgdA3sB8+1HOY+E4L8nMGXM/eCrox
         wwsovKwvszoSdc5B7e0UXOcsKK9YvikSqOelNNNchlgtK0sR2OZCeH73GFvw3SvUdov7
         VQSTPLAChFIf2X1nrTOfcolaOvfa5Ey4D+RwkhLHhvLAnOYE6hqoeFM0euOfMRvSO/Mp
         zmnQ==
X-Gm-Message-State: AOAM5313ZstgwSk8W1ZMGpISwdZzKOYPGCu2gDxlvzsu8d6snLY1+k7e
        MP6vb6Lo2Tc1LDizJMpmiX85N/q8jtfBiVo=
X-Google-Smtp-Source: ABdhPJxm8PTm8GV67URDpWm+ruVimL263DiRMvQSkPWTdfF+6ykLYu749Qsb3g8GDsFUzpQF0GFx6o5daJQkNyM=
Sender: "saravanak via sendgmr" <saravanak@saravanak.san.corp.google.com>
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:6d36:b798:55d7:f5c5])
 (user=saravanak job=sendgmr) by 2002:a25:5f02:: with SMTP id
 t2mr9740666ybb.161.1612564007719; Fri, 05 Feb 2021 14:26:47 -0800 (PST)
Date:   Fri,  5 Feb 2021 14:26:36 -0800
Message-Id: <20210205222644.2357303-1-saravanak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.478.g8a0d178c01-goog
Subject: [PATCH v4 0/8] Make fw_devlink=on more forgiving
From:   Saravana Kannan <saravanak@google.com>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Len Brown <len.brown@intel.com>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@ucw.cz>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Saravana Kannan <saravanak@google.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-acpi@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

There are a lot of devices/drivers where they never have a struct device
created for them or the driver initializes the hardware without ever
binding to the struct device.

This series is intended to avoid any boot regressions due to such
devices/drivers when fw_devlink=on and also address the handling of
optional suppliers.

Patch 1 and 2 addresses the issue of firmware nodes that look like
they'll have struct devices created for them, but will never actually
have struct devices added for them. For example, DT nodes with a
compatible property that don't have devices added for them.

Patch 3 and 4 allow for handling optional DT bindings.

Patch 5 sets up a generic API to handle drivers that never bind with
their devices.

Patch 6 through 8 update different frameworks to use the new API.

Thanks,
Saravana

Saravana Kannan (8):
  driver core: fw_devlink: Detect supplier devices that will never be
    added
  of: property: Don't add links to absent suppliers
  driver core: Add fw_devlink.strict kernel param
  of: property: Add fw_devlink support for optional properties
  driver core: fw_devlink: Handle suppliers that don't use driver core
  irqdomain: Mark fwnodes when their irqdomain is added/removed
  PM: domains: Mark fwnodes when their powerdomain is added/removed
  clk: Mark fwnodes when their clock provider is added/removed

 .../admin-guide/kernel-parameters.txt         |  5 ++
 drivers/base/core.c                           | 58 ++++++++++++++++++-
 drivers/base/power/domain.c                   |  2 +
 drivers/clk/clk.c                             |  3 +
 drivers/of/property.c                         | 16 +++--
 include/linux/fwnode.h                        | 20 ++++++-
 kernel/irq/irqdomain.c                        |  2 +
 7 files changed, 98 insertions(+), 8 deletions(-)

-- 
2.30.0.478.g8a0d178c01-goog

