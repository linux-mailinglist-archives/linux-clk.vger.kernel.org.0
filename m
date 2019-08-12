Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03A3789E74
	for <lists+linux-clk@lfdr.de>; Mon, 12 Aug 2019 14:33:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbfHLMc7 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 12 Aug 2019 08:32:59 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35581 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726592AbfHLMc7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Aug 2019 08:32:59 -0400
Received: by mail-wr1-f65.google.com with SMTP id k2so18562404wrq.2
        for <linux-clk@vger.kernel.org>; Mon, 12 Aug 2019 05:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nr8iX58l/pylFA11X0pfxij8SKgcdcbQ3mPsulHOLOw=;
        b=TSTYHZacvPBZRPOGOkxNmW9UwYDLYQIJpf0XtATvpOeYqCrXMPefQnRcRIJ7HPJlnb
         /3QsD43K5VNs4j/tgWMwF+admBA2wrJDJ5g4yQGP8nPI+uuDVxOiyuhxlW+nqh1XX4UL
         r9iQUW1yvHwoDz09Auy0e3mOyybZGpRccN7ORw1Ivw4LxzHWpBbHjkQYhL1b4Slsz1ZA
         by3d9kx+/1h602zfcj61H8MqdxJP6HF4QiJEfVdn0MgsH95jUI856gTFHUNiYC0Ykbof
         eFzmWVaoqdEVqaLTaQneOFEH1xhsZNY35BDL9N5aC1m4Wz/PcdYC2+mU0RCrs0556DHQ
         NhMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nr8iX58l/pylFA11X0pfxij8SKgcdcbQ3mPsulHOLOw=;
        b=YjkK7wQb17xHCZemtOF62+Ez1DgtNhQMYZ94mCgH2T73k4OFxlRNOUuYWkvW08kg1f
         QqJPVyICakG9UMi4dzpzpMebUSSCJpWiayjRrcKBrtQlTE3YZALnX53fTp5fGFJuRbBp
         wOodapm5mKWrm+yYrDXzC6qrDajtQLFsD7AooKdsuOxsBZYzoi1h1LdujDciS6IUTqSQ
         NIMG7dlgI79bEPTenxcbwe/vU2W5deNRNQwEJiV78h46xFSu8RuKvQWL6z4eliroWxFn
         ZpNHPB7b3GntpL4H5UMApnYssvB786z0/j5ruGj7FZ5trrQcng/u9+Xg6uSlQDt590wE
         JtHg==
X-Gm-Message-State: APjAAAX3w38PQZR52+zm0e4nb0doZw5aGajOy3JO8NVdXquJNtrnAvQX
        0IYmlYlNOOyS1x6PhBYxiNbM8w==
X-Google-Smtp-Source: APXvYqx9Q+ux5GFsRAjfYY9EDz5s7kgz3ZmgnTcN7772qjvFYGrIolvNNUxhgaoQ+kq04Vg7URWh2g==
X-Received: by 2002:adf:c613:: with SMTP id n19mr40465331wrg.109.1565613177657;
        Mon, 12 Aug 2019 05:32:57 -0700 (PDT)
Received: from starbuck.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id z6sm15886432wre.76.2019.08.12.05.32.56
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 12 Aug 2019 05:32:57 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] clk: meson: axg-audio: add reset support
Date:   Mon, 12 Aug 2019 14:32:51 +0200
Message-Id: <20190812123253.4734-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patchset adds support for the reset provided in the register space
of the g12a audio clock controller

Changes since v1 [0]:
* Fix typo reported by Stephen

[0]: https://lkml.kernel.org/r/20190703122614.3579-1-jbrunet@baylibre.com

Jerome Brunet (2):
  dt-bindings: clock: meson: add resets to the audio clock controller
  clk: meson: axg-audio: add g12a reset support

 .../bindings/clock/amlogic,axg-audio-clkc.txt |   1 +
 drivers/clk/meson/axg-audio.c                 | 107 +++++++++++++++++-
 drivers/clk/meson/axg-audio.h                 |   1 +
 .../reset/amlogic,meson-g12a-audio-reset.h    |  38 +++++++
 4 files changed, 145 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/reset/amlogic,meson-g12a-audio-reset.h

-- 
2.21.0

