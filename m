Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DEC1C3368
	for <lists+linux-clk@lfdr.de>; Tue,  1 Oct 2019 13:55:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732321AbfJALzR (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 1 Oct 2019 07:55:17 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33024 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726320AbfJALzR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 Oct 2019 07:55:17 -0400
Received: by mail-wr1-f68.google.com with SMTP id b9so15165596wrs.0
        for <linux-clk@vger.kernel.org>; Tue, 01 Oct 2019 04:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GHLe7e8r+/FCVT1kzqY6hP+wa7uaYw8XO2eGQ9nU4rA=;
        b=n31hAYExjy5IepO7PyO8Fs/EZZXom6l5oc/S0Eje24xWlwdjaUkLrihcDEXU8aP0E1
         run/3jjD6Gb3zzpU31ruhE7R7xaQxOB8pGjEuUfQyELF+OAZqEAtv9mWv7LQMwu0EqTO
         TkJKqCfEPacNHLfzgE948KXWTc7nPzvvfonuSWVrRluE4SD3jiOe4IVlfv2oIjpQtsa/
         ie1LbZYtj4Bm1Ygcgg6LAUsZUCrossZpofAFOcDwGT9ojXcuMF+eZwy54T76dRZPC+yb
         L/daQ6pv8Zx95jDWkm0NcLQCTovnQXN6odO3bDWsirk78NgatrVgN/70qAvTnKzW9HPZ
         H2Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GHLe7e8r+/FCVT1kzqY6hP+wa7uaYw8XO2eGQ9nU4rA=;
        b=YqPW9XtBVpHnfkms9DR2QIHOz7001uYEXA8m3oCqrvbqOjRcUTEtT0ofaCaEGy/2V3
         Wz0vT17AYfsH0uD2kfndXitLlMRDO2IHTpwpL5sa429MWZeW1TqjJ4/72cLqyYLQJ1vm
         weWk+1YpDvjFb6sH5KnE5bbUAhoGYbK72+AD6/nqVMVeKKiohPUhBzfbygSOGNHrdHer
         aoCglb1O7lGV7BgbXBA7VhfovzahfzTC9/kr5fKeQ0GkqMQvYSViAIOYKsRGzi3u4vdw
         fQbNSE3uKSiktQfOFAxrT8LK90/2lSL9o6Z9EqFenaQDSlR98dpKs15UMcx/Fu0tU53D
         iHNQ==
X-Gm-Message-State: APjAAAWFxmzYUu8RHwoOw/sJb+eEzRkDcX49XpLk68kgbNewCd3cpI+f
        R+f5AdHGmXsSHxUBK+Zy95OP3Q==
X-Google-Smtp-Source: APXvYqy2H8crN8Mg+areHNQoEnZLARfxMocEJYSpFDoDmuborFyk3aLbhncz/HrZ7l7SjoG4yuQ+ww==
X-Received: by 2002:adf:bb8e:: with SMTP id q14mr18860595wrg.74.1569930914927;
        Tue, 01 Oct 2019 04:55:14 -0700 (PDT)
Received: from starbuck.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id p85sm4052171wme.23.2019.10.01.04.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 04:55:14 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/7] clk: meson: axg-audio: add sm1 support
Date:   Tue,  1 Oct 2019 13:55:03 +0200
Message-Id: <20191001115511.17357-1-jbrunet@baylibre.com>
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

Change since v1 [0]:
 - Fix newline in the last patch

[0]: https://lkml.kernel.org/r/20190924153356.24103-1-jbrunet@baylibre.com

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

