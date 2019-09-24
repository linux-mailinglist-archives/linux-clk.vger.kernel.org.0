Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94DC1BCB7C
	for <lists+linux-clk@lfdr.de>; Tue, 24 Sep 2019 17:34:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389877AbfIXPeC (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 24 Sep 2019 11:34:02 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40045 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728702AbfIXPeC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 24 Sep 2019 11:34:02 -0400
Received: by mail-wm1-f65.google.com with SMTP id b24so533965wmj.5
        for <linux-clk@vger.kernel.org>; Tue, 24 Sep 2019 08:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BVrzY1NA5Ch72acoAjxkDHVhN4/WGgUil5qUxNRRH7o=;
        b=NEnONSEsVbr/P7iWXVn1NB30VoyNPibfxL6JPNvs+Wa+FQKgX+BO3sG/7Pa8Tj/kDN
         EWbfbmLeDMMldOVcGmotYrPvIhzOHm4WDIRcdKZZFY3pajkZuTNdja+qvr2Y7608OBwG
         uXD8s/aUhfMn1bX6+ciSPn5LtHzQV3067gUDCO7V0Ycx0Mj5KJX9p3mK14eVv7G96rT7
         di/GeqkqnhNB/Nh6UFrsb5LA6XwcWZd/Rs4k+/YiQ9j/SzWlyqVSEUcGqVO2tOEDuWIa
         BAdKgEis7K5HslkRrMeXS6m4z7L8UjepywyoKpol17FoAXFe1c5zMYVeG1NG5e31Obh4
         sTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BVrzY1NA5Ch72acoAjxkDHVhN4/WGgUil5qUxNRRH7o=;
        b=d0OwZWUP6H7vLUkH3x+HTQ6Cp6fOKZf/2XTyLgpOoM9Gnvi/NnaU4Px65qeB/z/453
         HcxdrGNEXktAhbTbc5SFL7KyeQTYlkR2cexJJLNqx+/ayXidvST0bPSyjcAAMKoS1Yj4
         yVaCmSV/VFjva1pUjIWp96i6BSXX7dTd3B6fYx+CeJN+5UTmJg+pFHe/fl6lQNw+QJaJ
         TfxFHTNaZ4AVJxgjAXWt6+FY6jtnPHwveHFnHEkrY2FJEH5ulcdBkK+FuLq0muDAaf2l
         XtL14/HlvpsQTnj4OFv3V6TrGGaq7zCCeScK01ad8kwfMJSyvI6zE8q6l9qhGX52gxE5
         jWtw==
X-Gm-Message-State: APjAAAU2RJGWjGXGxsQ+5XP+z6T9sELzkxvtQBR4+bCDApHOtnRKE4t8
        N8WghRPC++zoUtiJasc22wsyT20rdfVnPQ==
X-Google-Smtp-Source: APXvYqyg/jaDIFG3IyGsgXjUNtj7JsiTHUa9FnEaXGDBkdZpMfihQgExMr7nYHu57aDRvaYl8zLFLg==
X-Received: by 2002:a1c:f30b:: with SMTP id q11mr711033wmq.57.1569339240364;
        Tue, 24 Sep 2019 08:34:00 -0700 (PDT)
Received: from starbuck.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id d10sm144240wma.42.2019.09.24.08.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2019 08:33:59 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] clk: meson: axg-audio: add sm1 support
Date:   Tue, 24 Sep 2019 17:33:49 +0200
Message-Id: <20190924153356.24103-1-jbrunet@baylibre.com>
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

