Return-Path: <linux-clk+bounces-24547-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E6043B00B16
	for <lists+linux-clk@lfdr.de>; Thu, 10 Jul 2025 20:11:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB32A3B2500
	for <lists+linux-clk@lfdr.de>; Thu, 10 Jul 2025 18:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39F072FC3DC;
	Thu, 10 Jul 2025 18:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MX7dmqd9"
X-Original-To: linux-clk@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6D12EFD9D
	for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 18:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752171066; cv=none; b=MFX6U6MsomNMnjV5sLIwxW2dUako+yuD0PDf6Sk5UJUHALNcWN0ti/IO3dTIQy3uQQ+6rQ4e5atuBWn/vuMxW0Vi1RhIE8pUYaA13yPrwOEqSvETjN75i8QwW07HriDEEe78Oq9QOr+sxsSSww+jN7wxfYMzYhO91ZTs89PjvkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752171066; c=relaxed/simple;
	bh=kyRQoyVM2bzWbnGPxc1gi9+NEdvtsmR7MWvYL04wqOE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=q/HJxE69onEG+cnh0A+wvTi/eLfjRluDfEP9qLCAG7s++82URK1NB+VyzfpeX6XlyqaRUcnukXor1vJ/QLojSVT2YpmhopLGzrisQC7+KR1cQ9NJety7ZsUsaUcsD6XxqUSunO7ZskFUkEKvLv5OI3wi7YK1KWzvjt21S8acc0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MX7dmqd9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752171063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UDaamw5XinBR9QkXrVlCRaMipACe0i/+L3o+AWfTDMU=;
	b=MX7dmqd9E4IBMZIpYOzdSqAlr1BEMMtW2g62ox1cWdA4T0VjDyQ8c1VTgbNMZ45eJdHU1X
	2q0bR2lWtPTlvMvfmMbp4llKtM8CeuVq61V+oeLx3NLiHouDAqPpk+zEnC99xMIJlAqkeE
	0wMDdXyHRnjGL5lHAdai0DDIHNTf56k=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-IWhSOG8nPTOmIO1Bo500Kg-1; Thu, 10 Jul 2025 14:11:02 -0400
X-MC-Unique: IWhSOG8nPTOmIO1Bo500Kg-1
X-Mimecast-MFC-AGG-ID: IWhSOG8nPTOmIO1Bo500Kg_1752171062
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d413a10b4cso214009685a.1
        for <linux-clk@vger.kernel.org>; Thu, 10 Jul 2025 11:11:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752171061; x=1752775861;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UDaamw5XinBR9QkXrVlCRaMipACe0i/+L3o+AWfTDMU=;
        b=f5TfNkx8dOMSjhU/ckCrbTDW42IXBxIznEPesN/3YeyoVSHQ44dG7Z9QFsEo4/pEGw
         u3qaF9Dkd3jhPYgtTsbbdsQqjENXkYp7bbAbzO9xEbRp0W/9K0bcA1fO9Cud9vmVhZUD
         p2XNXMDh8PQi+5vkfUy/WBIEdBPhsn0nSa5RlfPYK1n0SwUK/3zg6UwYovVayEPCrGP+
         On4HOyvYgNde+xLQMzMEZgyYC94DJbVdT5ixQYxYn8/uV/yLvLH2vJUnl+sjlxYluxd4
         gjSK2Kzp/ag6gqvF8T0Uehwifp7RhgEpuTa9SyNSjidArHeMXBVFe69qwwqVn5aJ6y5E
         73Rg==
X-Gm-Message-State: AOJu0Yw/zRpkhWdNPYQ6bt5Y5YiJFU0FddJS3FjGtbQaPlCsaQ7OQT6g
	DwKQpXw09ST45mCCSUUODU7/8rXmkUsIquyLbL/jBoaYPGiVlFBxB3rnPjKcsVee4SANmqkZxup
	1CZ+hsc/mNm368R9JaIyFKqI22AWwz9cZEeQRGViuzVv4RbgIshVr+sNxuAnd6IoJpFoH9O6s
X-Gm-Gg: ASbGnct1GrqYmIPD2EZlxFoLaLR9iFBL79RWUV0/MKxWR5m1cUdzmq30MAUCOFvfmSq
	yxXndriB3qG5bAl1f1yDb4IFgmVMv/61ZHF07r/haNelB54jrmN3JJB6C8dinWyxsuxcUpBln2A
	2+wQExA3HSZ9Mg2SmA643JSw033leiHoZOYIJT1+LMybQ1iE6pKKMaaGFUHhZ9wbCdaJRvGE54Q
	aGfoSoCTiPSg/2997RmbAgbneFS9GBYwD5BxTaiF2FCCM7PlFcCDTQkxB+H4GwVRmHCJTr1W0Cs
	MXlXjeK7Mn8FacjNLjL0GQlJ/3H02wPNJpwcVwPMa7U1HGDt2y+8jnYAkoo1
X-Received: by 2002:a05:620a:4726:b0:7d5:dcd9:57f4 with SMTP id af79cd13be357-7ddea818e2bmr78794785a.18.1752171061203;
        Thu, 10 Jul 2025 11:11:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYWoqzrM13LlMP0WzQq6WZZk3qyqsWk5e4K0LKkki76ZGMrwuKyffsVmVRcU9EDW0/eLxBfw==
X-Received: by 2002:a05:620a:4726:b0:7d5:dcd9:57f4 with SMTP id af79cd13be357-7ddea818e2bmr78788985a.18.1752171060677;
        Thu, 10 Jul 2025 11:11:00 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcde806289sm124403285a.78.2025.07.10.11.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 11:11:00 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 14:10:41 -0400
Subject: [PATCH] hwmon: ltc4282: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-hwmon-round-rate-v1-1-64fbe4bf3d05@redhat.com>
X-B4-Tracking: v=1; b=H4sIACACcGgC/x2MywqAIBAAfyX23IIaEvQr0cFqyz2ksfaC8N+TY
 C5zmHkhkTAl6KoXhC5OHEMRXVcweRdWQp6Lg1HGqlYr9PcWA0o8w4ziDkI9msK4WGcbKNkutPD
 zL/sh5w8hKVKwYgAAAA==
X-Change-ID: 20250710-hwmon-round-rate-1b21b2bf5a53
To: Nuno Sa <nuno.sa@analog.com>, Jean Delvare <jdelvare@suse.com>, 
 Guenter Roeck <linux@roeck-us.net>, Maxime Ripard <mripard@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752171059; l=5669;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=kyRQoyVM2bzWbnGPxc1gi9+NEdvtsmR7MWvYL04wqOE=;
 b=6eQpeXc1h08bv2MtiVCAFjsSZrIXlAVycUsMGd5pLQ4KsDXNvjBRCIiUC0L5D2hdf/GXf0G8Y
 8Y30vGDGn/qB/i6oj2zQH7Ti/uRnt5rMGt6Znb6AwrL7fqIqUn6jpuy
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
appended to the "under-the-cut" portion of the patch.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Coccinelle semantic patch is below. It's large and I don't want to
pollute the kernel changelog with the same code hundreds of times,
so that's why it's included under the cut. For subsystems with more
than one patch, I've included it on the cover letter.

    virtual patch

    // Look up the current name of the round_rate function
    @ has_round_rate @
    identifier round_rate_name =~ ".*_round_rate";
    identifier hw_param, rate_param, parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    	...
    }

    // Rename the route_rate function name to determine_rate()
    @ script:python generate_name depends on has_round_rate @
    round_rate_name << has_round_rate.round_rate_name;
    new_name;
    @@

    coccinelle.new_name = round_rate_name.replace("_round_rate", "_determine_rate")

    // Change rate to req->rate; also change occurrences of 'return XXX'.
    @ chg_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier ERR =~ "E.*";
    expression E;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    -return -ERR;
    +return -ERR;
    |
    - return rate_param;
    + return 0;
    |
    - return E;
    + req->rate = E;
    +
    + return 0;
    |
    - rate_param
    + req->rate
    )
    ...>
    }

    // Coccinelle only transforms the first occurrence of the rate parameter
    // Run a second time. FIXME: Is there a better way to do this?
    @ chg_rate2 depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    - rate_param
    + req->rate
    ...>
    }

    // Change parent_rate to req->best_parent_rate
    @ chg_parent_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    - *parent_rate_param
    + req->best_parent_rate
    |
    - parent_rate_param
    + &req->best_parent_rate
    )
    ...>
    }

    // Convert the function definition from round_rate() to determine_rate()
    @ func_definition depends on chg_rate @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier generate_name.new_name;
    @@

    - long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
    -               unsigned long *parent_rate_param)
    + int new_name(struct clk_hw *hw, struct clk_rate_request *req)
    {
        ...
    }

    // Update the ops from round_rate() to determine_rate()
    @ ops depends on func_definition @
    identifier has_round_rate.round_rate_name;
    identifier generate_name.new_name;
    @@

    {
        ...,
    -   .round_rate = round_rate_name,
    +   .determine_rate = new_name,
        ...,
    }

Note that I used coccinelle 1.2 instead of 1.3 since the newer version
adds unnecessary braces as described in this post.
https://lore.kernel.org/cocci/67642477-5f3e-4b2a-914d-579a54f48cbd@intel.com/
---
 drivers/hwmon/ltc4282.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/ltc4282.c b/drivers/hwmon/ltc4282.c
index 424fa9e3a0993f74d7bd1b2e3c98acd954217a98..dbb30abcd343f3dac46bd87cc52638b75eb5b275 100644
--- a/drivers/hwmon/ltc4282.c
+++ b/drivers/hwmon/ltc4282.c
@@ -177,13 +177,15 @@ static const unsigned int ltc4282_out_rates[] = {
 	LTC4282_CLKOUT_CNV, LTC4282_CLKOUT_SYSTEM
 };
 
-static long ltc4282_round_rate(struct clk_hw *hw, unsigned long rate,
-			       unsigned long *parent_rate)
+static int ltc4282_determine_rate(struct clk_hw *hw,
+				  struct clk_rate_request *req)
 {
-	int idx = find_closest(rate, ltc4282_out_rates,
+	int idx = find_closest(req->rate, ltc4282_out_rates,
 			       ARRAY_SIZE(ltc4282_out_rates));
 
-	return ltc4282_out_rates[idx];
+	req->rate = ltc4282_out_rates[idx];
+
+	return 0;
 }
 
 static unsigned long ltc4282_recalc_rate(struct clk_hw *hw,
@@ -1124,7 +1126,7 @@ static ssize_t ltc4282_energy_show(struct device *dev,
 
 static const struct clk_ops ltc4282_ops = {
 	.recalc_rate = ltc4282_recalc_rate,
-	.round_rate = ltc4282_round_rate,
+	.determine_rate = ltc4282_determine_rate,
 	.set_rate = ltc4282_set_rate,
 	.disable = ltc4282_disable,
 };

---
base-commit: b551c4e2a98a177a06148cf16505643cd2108386
change-id: 20250710-hwmon-round-rate-1b21b2bf5a53

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


