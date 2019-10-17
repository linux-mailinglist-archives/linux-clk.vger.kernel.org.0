Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17362DAA08
	for <lists+linux-clk@lfdr.de>; Thu, 17 Oct 2019 12:31:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405038AbfJQKbA (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 17 Oct 2019 06:31:00 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:33448 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405379AbfJQKbA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Oct 2019 06:31:00 -0400
Received: by mail-pg1-f194.google.com with SMTP id i76so1119304pgc.0
        for <linux-clk@vger.kernel.org>; Thu, 17 Oct 2019 03:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=fXpZrgSR4m1AdPkf5LQ4vreDl7P/F5O2vClvEl9LG+E=;
        b=RjcqwM/151Rh6shqBPSS+/LsnKHp4tPzH7rlCNumhGcdPu5np2zWiScneSjR3DPfNK
         JSmgBgwcYc2Wq+I+tuFJJfzoKLdkZTa8plMbttbWPHGfnbN/VEmdTGvvDIpHjb5MjRNE
         wZXcyV2s9EIiPjBgCF+7ZfzX1ofKXFNsnNIAp/5dSWOLt9rkUyJ7HH7kmczmrqeDRWdX
         yoe6oaFXiJZKhYhvEFhbPeQuZvu21eI033tpasrxjBDx88WiCb6e3TSXmgyXHo6HH1nv
         cj551XzWC47q5Acat5rKiyCgf5zmD4X9jsYYUc7+7YYDhJh+duAhoXVL1w6B2qyssTDo
         AgFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=fXpZrgSR4m1AdPkf5LQ4vreDl7P/F5O2vClvEl9LG+E=;
        b=Ytt+C9Sm7y6gqzBZvG6XYEjUdfTqD1277juTB7lOsnYljmfTEJMWsKu+qgThLXppxn
         dgwv52gUiyp6H2wstgk9qifbR3Zrchcm3rmcwsIlOZj3EgN0rP5aq2OShOKlTG+TGypS
         07WnkhA4kEVR9zc1DaDZrOPyotkjjE53Na5hjYeE3c41Ks4rpMMfsRwc4snvqrFogfOr
         s6x/WYNob39SCaVFdabSbcgHRstiaJ2w6bsTiiNm70hi1BT1ASmIzRvLiVo6BAgu0KrR
         5PEEWlG/VEaMDUn6rgqdIuUEZ0xjjjkGAymfS6PyP0sloLOOlmRbwC/eyFQ0zBoIV3Wh
         oYXQ==
X-Gm-Message-State: APjAAAVgGIJyzjcZstBm92mWB57XB5gjd0N6SiEnGFX/nuoTTAgtYYL1
        bihz4SilpJLfYwoEPDKYEGWjWw==
X-Google-Smtp-Source: APXvYqwLgDPSgPcHP07oEn8Yz+bEr9lP6N0qW51t7I6WtTfBfDIdS2uiMgDfv+7WesuoPKyBZSt+aQ==
X-Received: by 2002:a63:e145:: with SMTP id h5mr3330375pgk.447.1571308259127;
        Thu, 17 Oct 2019 03:30:59 -0700 (PDT)
Received: from localhost ([49.248.54.231])
        by smtp.gmail.com with ESMTPSA id f3sm2233388pgj.62.2019.10.17.03.30.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 03:30:58 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        daniel.lezcano@linaro.org, viresh.kumar@linaro.org,
        sudeep.holla@arm.com, bjorn.andersson@linaro.org,
        edubezval@gmail.com, agross@kernel.org, tdas@codeaurora.org,
        swboyd@chromium.org, ilina@codeaurora.org,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
Subject: [PATCH v2 0/5] Initialise thermal framework and cpufreq earlier during boot
Date:   Thu, 17 Oct 2019 16:00:49 +0530
Message-Id: <cover.1571307382.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Changes since v1:
- Completely get rid of netlink support in the thermal framework.
- This changes the early init patch to a single line - change to
  core_initcall. Changed authorship of patch since it is nothing like the
  original. Lina, let me know if you feel otherwise.
- I've tested to make sure that the qcom-cpufreq-hw driver continues to
  work correctly as a module so this won't impact Android's GKI plans.
- Collected Acks

Device boot needs to be as fast as possible while keeping under the thermal
envelope. Now that thermal framework is built-in to the kernel, we can
initialize it earlier to enable thermal mitigation during boot.

We also need the cpufreq HW drivers to be initialised earlier to act as the
cooling devices. This series only converts over the qcom-hw driver to
initialize earlier but can be extended to other platforms as well.

Amit Kucheria (5):
  thermal: Initialize thermal subsystem earlier
  cpufreq: Initialise the governors in core_initcall
  cpufreq: Initialize cpufreq-dt driver earlier
  clk: qcom: Initialise clock drivers earlier
  cpufreq: qcom-hw: Move driver initialisation earlier

 drivers/clk/qcom/clk-rpmh.c            | 2 +-
 drivers/clk/qcom/gcc-qcs404.c          | 2 +-
 drivers/clk/qcom/gcc-sdm845.c          | 2 +-
 drivers/cpufreq/cpufreq-dt-platdev.c   | 2 +-
 drivers/cpufreq/cpufreq_conservative.c | 2 +-
 drivers/cpufreq/cpufreq_ondemand.c     | 2 +-
 drivers/cpufreq/cpufreq_performance.c  | 2 +-
 drivers/cpufreq/cpufreq_powersave.c    | 2 +-
 drivers/cpufreq/cpufreq_userspace.c    | 2 +-
 drivers/cpufreq/qcom-cpufreq-hw.c      | 2 +-
 drivers/thermal/thermal_core.c         | 3 ++-
 11 files changed, 12 insertions(+), 11 deletions(-)

-- 
2.17.1

