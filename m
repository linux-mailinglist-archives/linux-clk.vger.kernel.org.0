Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6CD8B774F
	for <lists+linux-clk@lfdr.de>; Thu, 19 Sep 2019 12:25:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389203AbfISKZZ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 19 Sep 2019 06:25:25 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35473 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389171AbfISKZY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Sep 2019 06:25:24 -0400
Received: by mail-wr1-f68.google.com with SMTP id v8so2526090wrt.2
        for <linux-clk@vger.kernel.org>; Thu, 19 Sep 2019 03:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2A0oosZIpjBMenE6Tjm33BxMZdklQECEBVCtAhWMYQs=;
        b=ARPIhl8y30FO/F6oN6rrJzhE+e4JFkdGSwgjSFtfDZWZcWA/5EH5LBr4L6b0SKWglH
         UbVGQsTdPnHYSTM0FLHAvMtgmlZahzJaO25HwC8vbQ12W7cm3h9dFlL3FkstMUbU3S28
         4fm6Vth4wRpsGNZHNR6meJZD//S5QE3E6NFqQnYecq2YfXug/zatNdwqIm9lhAAKb9hY
         Mk7OrUEA6satXsZqIOlyBR39Nioo4KQgA4VYIhCnVz9Y91y2ppbs4ap7veYd6uCv2lOI
         pjhQdI9L7aOmQq/5zwbXHxCW9UhgyjR6TRmw74BMHQyWnyMsXrvAs6P17sdEuZdTqPji
         QWxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2A0oosZIpjBMenE6Tjm33BxMZdklQECEBVCtAhWMYQs=;
        b=aoUz3rsa6GEbTaC9k4qGaOIAV4Hp5RtQ1t6u7FOtu4DLDmupbyXLvKGDfLpF1b46Mc
         y93a21jVFKY+91grABtZYYbSbvHE0GDo4c/ZXBILpIy1MN5zJOMDlZuMXjQVOYzIwKud
         wELAF8KMj1oT8AvJg+0y1paRK8AY56KHSe7BvDc+fAHGbVa6LZTQgQPQMEtM+ENiV6pH
         EgqMDr/0NPNAnXxe1i6cTJzl2EqdouH3l83/Ra1sfYHVZdh34aGBiEvgxAWv+/CPzJ39
         t8OFUMpmC2Au5JLZC8YCN2UGKaTb7v5mVe4rKH026Ma16g94gHYSnObAXx5aC6Q6V3vZ
         rXrA==
X-Gm-Message-State: APjAAAU3wLS93az5zbQ58tsmPWa8zKj1Rd6rJ5Tab0otBEvkmfHvDkxm
        WUnxd+lvqyiw8efxwlWbB4TvOQ==
X-Google-Smtp-Source: APXvYqzpnu2phlLQMoNEuMIncosAx77n7gxWTvOlJbGfGU75RyLU3YIELaLuaI5zdmBNdg+SLbrCIA==
X-Received: by 2002:adf:cc0a:: with SMTP id x10mr6471942wrh.195.1568888722613;
        Thu, 19 Sep 2019 03:25:22 -0700 (PDT)
Received: from bender.baylibre.local (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
        by smtp.gmail.com with ESMTPSA id a18sm19542000wrh.25.2019.09.19.03.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2019 03:25:21 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     sboyd@kernel.org, jbrunet@baylibre.com, mturquette@baylibre.com
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH RFC 0/2] clk: meson: g12a: handle clock hw changes while in suspend
Date:   Thu, 19 Sep 2019 12:25:16 +0200
Message-Id: <20190919102518.25126-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This serie aime to support when the suspend/resume firmware alters the
clock tree, leading to an incorrect representation of the clock tree
after a resume from suspend-to-mem.

For the Amlogic G12A/G12B/SM1 case, the SCPI firmware handling suspend
alters the CPU clock tree in various ways.

Since we know which part of the tree is possibly altered, we introduce here
the clk_invalidate_rate() function that will rebuild the tree from the
hardware registers in case parents and dividers have changed.

Finally we call clk_invalidate_rate() from a new resume callback to refresh
the CPU clock tree after a resume.

With the clock tree refreshed, CCF can now handle the new clock tree
configuration and avoid crashing the system on further DVFS set_rates.

Neil Armstrong (2):
  clk: introduce clk_invalidate_rate()
  clk: meson: g12a: add suspend-resume hooks

 drivers/clk/clk.c        | 70 +++++++++++++++++++++++++++++++++++++++
 drivers/clk/meson/g12a.c | 71 +++++++++++++++++++++++++++++++++++-----
 include/linux/clk.h      | 13 ++++++++
 3 files changed, 146 insertions(+), 8 deletions(-)

-- 
2.22.0

