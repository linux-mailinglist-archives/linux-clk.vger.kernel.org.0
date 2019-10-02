Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 957E8C4A5E
	for <lists+linux-clk@lfdr.de>; Wed,  2 Oct 2019 11:16:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbfJBJPg (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 2 Oct 2019 05:15:36 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39344 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725908AbfJBJPg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Oct 2019 05:15:36 -0400
Received: by mail-wr1-f68.google.com with SMTP id r3so18759099wrj.6
        for <linux-clk@vger.kernel.org>; Wed, 02 Oct 2019 02:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yH4ZTSk2dw1y5h5K76pORaKv4pdr0m6BUkDf5tas0UM=;
        b=zc2FBs7z5S2aHmF35iyYbauzzs8pRQm213RXAZUZaRZNWslRhXz7GnASQPLyM9q/en
         7T7cS+egsJAyLZFRLbx7NDJfF7bR4qg2p6bVpUTK7EaYjSnkaN9TwDBdnYS2FZv1OMze
         OArWpi9IQhYJzBZzu34oUWewKmSIdOSPNjcmqEyjVXDHLLr94SmkSWe2CD5IobsS/yu7
         s7m2DrWXIVweiWMi4MPzTIjSnx7kc11PmofHBo8+h23lqLKL0gOc6ET0NNqAzz04sM4B
         m9HbhJo3a9IIGRKYGLLFR5NiFHKFsv2DGOZBtC71SWrsD90AKlEaov7T1msz1ppAHosn
         yQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yH4ZTSk2dw1y5h5K76pORaKv4pdr0m6BUkDf5tas0UM=;
        b=amcokEGBJo1h2z+qKIFEnuz0KdSQesmaJ1/F0t5HP/9ymJd9XGyu1vtTLJb073mBFX
         fncpTIeMembvCtuIW8TfEauH5ZLNHmeLZP+Wc1VPheTTVkH0rEQ+b8mB8+CYLOZmgWi9
         CcCwjx1PHxVIrl+wlHuxiWFZ/Cx8TyyHZDMJep/U3pTzXSGQaNmfsQsXV8qN176xa7qa
         RELR/yK5A5Bi1JEDvs0GRgSBp+1al0Au2lwjvIBo/6AHMD2AW7ztB6rxT0U4eVNoZHM1
         CWnLZaG+4L4n2ombejkcOZZUVjkho9AN5E7GjnLrT+4GCTHckFUUfp8U8GXRflihMVBy
         1CSw==
X-Gm-Message-State: APjAAAUWiQTXuXYIK+5ioBtVWk3GPJcFcdB5+J6KblwKgpJA9W5kyOLg
        XqjPiGxSfhwhLPJCZtgHezIMAw==
X-Google-Smtp-Source: APXvYqzswOHaJVWMVNqCnIuTNovQzfrpQ6257D/8Uph/LNaRknSti77zAUS9MQUECjWMbtME96+0MA==
X-Received: by 2002:adf:d08b:: with SMTP id y11mr1934045wrh.50.1570007732457;
        Wed, 02 Oct 2019 02:15:32 -0700 (PDT)
Received: from starbuck.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id r13sm32913737wrn.0.2019.10.02.02.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 02:15:31 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/7] clk: meson: axg-audio: add sm1 support
Date:   Wed,  2 Oct 2019 11:15:22 +0200
Message-Id: <20191002091529.17112-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The purpose of this patchset is to add the sm1 support to the amlogic audio
clock controller. The line count is lot higher than what I hoped for. Even
if extremely similar, there is a shift in the register address on the sm1
which makes a bit of a mess.

I could have patched the address on the fly if running on sm1 but the end
result did not save much lines and would have been a pain to maintain and
scale in the future

Instead I choose to re-arrange the driver to share the macros and declare
separate clocks for the clock which have changed.

Changes since v2 [1]:
 - Add missing gate ops for
  * sm1_clk81_en
  * sm1_sysclk_a_en
  * sm1_sysclk_b_en

Changes since v1 [0]:
 - Fix newline in the last patch

[0]: https://lkml.kernel.org/r/20190924153356.24103-1-jbrunet@baylibre.com
[1]: https://lkml.kernel.org/r/20191001115511.17357-1-jbrunet@baylibre.com>

Jerome Brunet (7):
  dt-bindings: clk: axg-audio: add sm1 bindings
  dt-bindings: clock: meson: add sm1 resets to the axg-audio controller
  clk: meson: axg-audio: remove useless defines
  clk: meson: axg-audio: fix regmap last register
  clk: meson: axg-audio: prepare sm1 addition
  clk: meson: axg-audio: provide clk top signal name
  clk: meson: axg_audio: add sm1 support

 .../bindings/clock/amlogic,axg-audio-clkc.txt |    3 +-
 drivers/clk/meson/axg-audio.c                 | 2021 +++++++++++------
 drivers/clk/meson/axg-audio.h                 |   21 +-
 include/dt-bindings/clock/axg-audio-clkc.h    |   10 +
 .../reset/amlogic,meson-g12a-audio-reset.h    |   15 +
 5 files changed, 1373 insertions(+), 697 deletions(-)

-- 
2.21.0

