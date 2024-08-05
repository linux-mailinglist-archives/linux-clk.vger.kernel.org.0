Return-Path: <linux-clk+bounces-10412-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 326059477C4
	for <lists+linux-clk@lfdr.de>; Mon,  5 Aug 2024 10:59:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 631181C2124F
	for <lists+linux-clk@lfdr.de>; Mon,  5 Aug 2024 08:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB3D5155389;
	Mon,  5 Aug 2024 08:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="GVoclNUp"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232601552FF
	for <linux-clk@vger.kernel.org>; Mon,  5 Aug 2024 08:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722848263; cv=none; b=GJjBDzsEWLU2xl3/T3mP68f6JKXnmV6k0K1SIfh0IzDunv4XNxB5yu9CFsXbF68i1wQ8OaOGCFCPer81+ZcJ1YpmVFIP/XAgtLXSrO2Ci34yknt7bfFuXGX6jIKTOn6quCPFCKMlgIYuPgCmNPSNl7B+3mCvyqE39nWu7LdaKkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722848263; c=relaxed/simple;
	bh=ZQ1dqPdC0EI5UKHt9zPT/jrOo7UBUKRw10Gyog+8f8k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NwOp6oQYSogkQmHVjYNf+adB6hGTiEjBZjCFsOywQ+ZP9pnWmCFPuq2nMxhAk2P0jzf7ae0uAfG19FkUHEW6ejgoJzJb3Os9nk4kt1NeDBBr7X3oB62M5Nl9QG67doR2QqKAJP9mu4PYlR6kKPMOrYtx7PmEcLLaV1pBDHc+5Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=GVoclNUp; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ef2c56da6cso115451941fa.1
        for <linux-clk@vger.kernel.org>; Mon, 05 Aug 2024 01:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1722848260; x=1723453060; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2sl3xw4gPw2mQiXFe6Kp18Lv6i1hPP28LJ8YNkidH90=;
        b=GVoclNUpuPfzy+gY9163Wjdh7YnjdEp2pSaDhz75gohpdprQLK3M2OFyy+hws5WXmp
         FZCpMaeHF/KQ82tVjH1Hz4pwMMd0qH70ZgMDq7QMuszeagI5czEfC24nhUnRC1LarieB
         m1+YPiC3i92dUk28tPjg7pZJxWYsmKl8JGdV/QW43El3HNrrSWijltY8NeI6fLO2xXYo
         7wrMgxcmTug0V9SK3p78GOC95MOgzjWCseL0IZiU/nSmKQSG8C9SXtEg7LBSYA9mEH6l
         Tg/r+DjRFRZOhsEpS7KyNE0+TOBdiofg+SP0ylu+q4o0jatT8Zt+GrVHjCk9ndFqx0UX
         RClw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722848260; x=1723453060;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2sl3xw4gPw2mQiXFe6Kp18Lv6i1hPP28LJ8YNkidH90=;
        b=lB/+8iEWXF5Xg9brVI9UnrEu8s3xW/+CHh6MVRAjijA6jBLZ1a7f9EjtW9DwtGo+0I
         6/KJDJjvKwLVkR43GoEC9lDRCwi86QelY8YVp8AnJ8m/rMgrdxchzLBIId0YAevy6/QG
         0UML/r69rB7nJTPdmqsk2j6QNq2xTjpjpwchY2lefPH4L+Qq3LeXhIDc+WV56zhmpucr
         4TjtP/vbHnu2AV3TLuO7fiBdhUBHCm75rTsnFRmg7kKyjFBOIwSUNKVUAfqjkACLcBAY
         PVv7J48gZtESmIuC8bqSUY4efHe8lgpsumy8vrK5vDzOl0xw/DQ4m1ZAOphEBOFEsA8g
         0yYw==
X-Gm-Message-State: AOJu0YzEXL9vW/1xIg1YOXKlk3ktyCi5Y1IBJc9t7DjvFKOtjPkTAJw/
	dE7NBXbnwppzA6S9MMFm7djrNgToRtyJytbBaMGGwjr6hkie+YG23UucHOBYrVicUetYell+0Tz
	ZCls=
X-Google-Smtp-Source: AGHT+IFptNAZ/nhTVNdaMWwDbSV/Pf9rJ5myyH8/hxWVpjg2LkUW90NNXA+c+MUSqvdBG7jDrAB7kw==
X-Received: by 2002:a2e:979a:0:b0:2ef:2b53:c785 with SMTP id 38308e7fff4ca-2f15ab35233mr69507871fa.41.1722848259768;
        Mon, 05 Aug 2024 01:57:39 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:1068:b792:523c:3f73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282bb9d786sm190235665e9.44.2024.08.05.01.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 01:57:39 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 0/2] clk: implement a new managed helper and add first
 user
Date: Mon, 05 Aug 2024 10:57:30 +0200
Message-Id: <20240805-clk-new-helper-v2-0-e5fdd1e1d729@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPqTsGYC/3XMQQ6CMBCF4auQWTumLQrVlfcwLAoMMJG0ZGqqh
 nB3K3uX/0vet0IkYYpwLVYQShw5+BzmUEA3OT8Scp8bjDInZZXGbn6gpxdONC8kWNtzOVSV6Xq
 nIZ8WoYHfO3hvck8cn0E+u5/0b/1LJY0KraZLWdq2bnV9m9k7CccgIzTbtn0BT+u3Sq0AAAA=
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-bluetooth@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1200;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ZQ1dqPdC0EI5UKHt9zPT/jrOo7UBUKRw10Gyog+8f8k=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmsJP/i2P3GDWw+duGWWCWvHa6h/R4q7wDq0b2O
 8C0u5MbNxyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZrCT/wAKCRARpy6gFHHX
 cjgcD/9Eekk3HZInYesFffUtcrjjRmMv7AxaFRH4MSVTXUA/X+KANBQ/dwABGH+tl220k+VFbaO
 62Etpy5ULmFRc4JGkFwv631QEw7iUE6pZ1i9rkXa70X1h0ZDTTZmxdi06nPhB7Rn+Oep/2W96+S
 YH39vBuD5iOBsOYRj49Bpi6DnQlgkg8E5DfkwWnDVVvNvCiN8m17KBmtwu8VmJVphCsEUm3fFf3
 hWKAWRlU6sFVz4Vg85udWNqz2Mq6CNLtUk0RqStD/bTa8+AZO8/1tYgPnaKduNjKiHlKU8X7zJE
 NgNFjY2aAz45+IwZnaz1q4VZ97kdtD+y8Swp6VXsjj5CpL9ie/n275cVstLhUH+HNdDl8skQSzP
 aY5WJROt8xQ+hwaa8SO0DkhWsyu4L6H1qy3mzYO2Zpm5r1jIUsFKCV+AXSx6nYlEyO/FoBmp/ZM
 RrP9xV6cD8do8hmzWMHJjT8no5IZzBq5sk9VWTC4+AxyxedP81gnBSpxoaLIfEuQsfjXV/efbwU
 wXUuPVvtlSOKfYbMo8o/x5QDyVLA/KM/DCNF7814jp4UMuLCDPyJTdwKVELc7UcDH8XP65QqAU1
 Wrkc8khtXAbo2iR/iYiKFU82eJbsG6yffeAJLI1bOIMaxg2oWrh+u2V3GqhZzTeg8H9fWppOCyK
 t01l2FQgstQ/OLA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

I'm posting this as RFC to see if there's any interest. I noticed that
some drivers do: clk_get() -> clk_set_rate() -> clk_prepare_enable(). I
was wondering if it's worth factoring this out into dedicated helpers.

This series adds a new such helper for the "optional-enabled" use-case
and the first user. Let me know if this makes sense.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- s/EXPORT_SYMBOL/EXPORT_SYMBOL_GPL/
- add a stub for !COMMON_CLK
- Link to v1: https://lore.kernel.org/r/20240801-clk-new-helper-v1-0-81e9338b7b17@linaro.org

---
Bartosz Golaszewski (2):
      clk: provide devm_clk_get_optional_enabled_with_rate()
      Bluetooth: hci_qca: use devm_clk_get_optional_enabled_with_rate()

 drivers/bluetooth/hci_qca.c | 24 ++----------------------
 drivers/clk/clk-devres.c    | 28 ++++++++++++++++++++++++++++
 include/linux/clk.h         | 33 +++++++++++++++++++++++++++++++++
 3 files changed, 63 insertions(+), 22 deletions(-)
---
base-commit: d6dbc9f56c3a70e915625b6f1887882c23dc5c91
change-id: 20240801-clk-new-helper-7853f662cda1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


