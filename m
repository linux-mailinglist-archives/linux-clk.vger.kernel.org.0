Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3C1A26DD1B
	for <lists+linux-clk@lfdr.de>; Thu, 17 Sep 2020 15:49:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726919AbgIQN3X (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 17 Sep 2020 09:29:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726783AbgIQN3L (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Sep 2020 09:29:11 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10836C061351
        for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2020 06:28:58 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id t10so2097014wrv.1
        for <linux-clk@vger.kernel.org>; Thu, 17 Sep 2020 06:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XLbqqZ/vpJpcdXaFd7VC2pcNFTGY4Iy4LUzor+NVcxg=;
        b=j1Ewtdfm6q53Q0PWp1kjz54MdZK6+8duFS/Rm1nvXupcPFqa5lJGyQfshtwmUPbmpD
         9wrB+PtDcm7gvGgJF9xsckuIV14q5YPCh1LFfSpJVfJjfXZ352DVACm1ZyzWzXKI3l44
         UhbIKHf6FGlCYxLYvTmCXJXzzLVXL3chdpMh1GA3d0wOYgwsPdpL9/P6Nvgo6tHw43ji
         JGqyWSHQ008Zubvbp7XuON2nTFcoIq63W1b5c09bmu3jVsicdkHNOrDVp5IW9hVab9KC
         BU4RjO+eBxzaWf5bAqaU3HqCGiNJbNEslZOlXfQ7QTuoPCssCbFFarFLtJFHT69jbMnX
         dfcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XLbqqZ/vpJpcdXaFd7VC2pcNFTGY4Iy4LUzor+NVcxg=;
        b=hZXBM0zpWNE+0cQejvAC5elRHf6CVPwhlbHgWg3DBOxRMKKY/Tzg4iR52BrObnQFop
         338snpNVqknZNiXTEogfQlSslGTOcVZ1AWLDwBWogs5bwh15DqkuOiKgpQOIcrOjRfQ9
         MkXgOUWDWorgFmd8/QKBzMkaNCdoUgHLvL2gEmuNzSoW2+qiJh6WckiRW5jeqLhQ+HS5
         GmPYDjFpx5KqtFO0uzi/SStqMk3bNUmW9Ad0z9DHi2TeTjqg8J6AnVjNlbwJex0dxT5p
         LTHPbQUehVK2wboM1HaNpJgII3FTxuNdJMpGfYsORSWf7PH/jeaIPK0M+0lQv7vZdJEI
         1tVQ==
X-Gm-Message-State: AOAM531hLUvgxID0j83lBV3ZaS1nHiI5jX/F0tTQn5ix+nXSG0ZP316L
        GyyJ8cHyjxP8PcmPxUe4uzIJwQ==
X-Google-Smtp-Source: ABdhPJxIxoY8/oezHyrHk5clz6STxjXu6oZ+2wLqR+YmY169D2v/URS3C6DnnrbMi+fUKqOGeugFhQ==
X-Received: by 2002:adf:e289:: with SMTP id v9mr32408611wri.14.1600349336204;
        Thu, 17 Sep 2020 06:28:56 -0700 (PDT)
Received: from srini-hackbox.lan (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.gmail.com with ESMTPSA id n10sm11486910wmk.7.2020.09.17.06.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 06:28:55 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     sboyd@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, mturquette@baylibre.com,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 0/4] clk: qcom : add sm8250 LPASS GFM drivers
Date:   Thu, 17 Sep 2020 14:28:46 +0100
Message-Id: <20200917132850.7730-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patchset adds support for GFM Muxes found in LPASS
(Low Power Audio SubSystem) IP in Audio Clock Controller
and Always ON clock controller.

Clocks derived from these muxes are consumed by LPASS Digital Codec.
Currently the driver for Audio and Always ON clock controller only
supports GFM Muxes, however it should be easy to add more clock
support when required.

Srinivas Kandagatla (4):
  dt-bindings: clock: Add support for LPASS Audio Clock Controller
  dt-bindings: clock: Add support for LPASS Always ON Controller
  clk: qcom: Add support to LPASS AUDIO_CC Glitch Free Mux clocks
  clk: qcom: Add support to LPASS AON_CC Glitch Free Mux clocks

 .../bindings/clock/qcom,aoncc-sm8250.yaml     |  58 ++++
 .../bindings/clock/qcom,audiocc-sm8250.yaml   |  58 ++++
 drivers/clk/qcom/Kconfig                      |   7 +
 drivers/clk/qcom/Makefile                     |   1 +
 drivers/clk/qcom/lpass-gfm-sm8250.c           | 296 ++++++++++++++++++
 .../clock/qcom,sm8250-lpass-aoncc.h           |  11 +
 .../clock/qcom,sm8250-lpass-audiocc.h         |  13 +
 7 files changed, 444 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,aoncc-sm8250.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,audiocc-sm8250.yaml
 create mode 100644 drivers/clk/qcom/lpass-gfm-sm8250.c
 create mode 100644 include/dt-bindings/clock/qcom,sm8250-lpass-aoncc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8250-lpass-audiocc.h

-- 
2.21.0

