Return-Path: <linux-clk+bounces-19677-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6129BA6BED8
	for <lists+linux-clk@lfdr.de>; Fri, 21 Mar 2025 16:55:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B50818837D0
	for <lists+linux-clk@lfdr.de>; Fri, 21 Mar 2025 15:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71A3F1F1511;
	Fri, 21 Mar 2025 15:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="TBNxRapp"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D27D1E98ED
	for <linux-clk@vger.kernel.org>; Fri, 21 Mar 2025 15:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742572519; cv=none; b=sFOCW/rxnSoADOD9ZbU9XdcBirnPF/n/AaPj7jfYnZ6DVAlhYmr5SRXMIXvYb5Qv+6L79TUVoz+lO04bfKHRVYHbBGtBt+KNd5zhKB0TxGaYnzfoUgZBnKpQH5q2YZyZiP9k67gWOsQFTVgfNiN6r1SfFyLwoLMs/Whjjfp5V6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742572519; c=relaxed/simple;
	bh=1wNtXhel12/P9++f5zzCWHX9NzteKr/42/osDVNIPRs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QprxMgk69S10Zxc0OPwlcrdhh1VdOZlI/E+0lhmEh5RMdZ0LM7y6kN2v3dT9sG7A4m0IlX3bVVH0+AoZTGXDelUocACa78cKXilnJ6zUMnEk1lkj6Q/bx9C0Pm8zG+k7MZOlN0+Dk7AGR9i20Sb7PMfWs4r487vjOJg6LAqtcmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=TBNxRapp; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso15957805e9.1
        for <linux-clk@vger.kernel.org>; Fri, 21 Mar 2025 08:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742572516; x=1743177316; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=keE5UAE8I7WQVpj+EG1JG1WPFCAgkdvUmiHSr+M5kNk=;
        b=TBNxRappCOi0ACvBXxjn5U2IBBHAuGlU1bWnqocxQFM3u7ck/pq9twTGJyayywwNBV
         XTdYLYdpEC3J0/9I2ilxeFpVobkOe1Nvj6FgwRtd9Tdeacjbm4O/uwYUKbdXE1oXkx+T
         ArD7IDUcz3KxadmoKFANu+mSZ+20lixUXTJ4/tJb43RnY3S6m0KDkF1OwDsYn9iSfUc2
         kZgGzZj5vSjGMJ029vb5sc1n3FU8abrE9hZavgwX32UKHJk2aITP/es3cZe+fJL669Q6
         G//pHczpmOEiI5xbAYQSw+DsKNG6vO6PClKE2P7DHuvlr1Dgx+ZQ/uBg0+47JMZL9rQH
         C0SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742572516; x=1743177316;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=keE5UAE8I7WQVpj+EG1JG1WPFCAgkdvUmiHSr+M5kNk=;
        b=ls+gZEvcF3q3+PlSZDh2yPST3egAcmZLlynevHMee5RdlN9kfw6NSzowKcbMy/4k5m
         fkwS6T8csFak+htInEhR+JiGwSTr7Z9kafNlgm+kmblVmiyNwN6vKDA8Mn0uZbVf9v++
         gI61874P3pIXObMNYFYVxIjt8PtI/fddAtv8obgHrfoGVJNPDeA9zTiYpz2GIZ+Tws9b
         lI8nXnG+HqcldRzboRCEAtD2JHFhmuLu6XdCOvFXV4eR7qJc3tjPIYxTdXNNpG4nnWlF
         9jabDZHvUx5fPNxU93zmOzW53YJ+l28VjUpMx97Kb0vqzBFuiQSnTbZl/Eohk0sd0sxs
         qgNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbLE3XJA6YVCrrq40vCme4fmpzq6FkuEAZ2kmskaTYX+kWf6dJEp9d0NMBBi5sWJrVTHZTk6D470g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsWo5PTnb1won7j5gfv3aWW2c11huPftyKpurNVD55dgWl7+4Q
	brWgfXypPvqTLq3cwJwOKpUZa76zjcVkdEvH8O4WzgXsOP+hZbVuJeKBhERN078=
X-Gm-Gg: ASbGncv3AjvDa3AuoF8eUZXveSZ04m8XoJh3XH8sl2YATbLEtCvJcZ3dtmgP75l65B9
	/lMgLdAAL7efFrFlIYXSftc/koxQO807VE9IyTgx4wrpzPuWPxLzyZXDHTbZs2S8ptLtlpGMtHl
	SivhIRmWOSgmFN65uZGY+maEzwfWoJuu8D6NDulbtfkk8O1GK8kxtfIBBjPryWZ1RYmKviMxUtN
	Izkcd4sFcqciYsSaHYKAiX0+0qBoDf9srCRUa5DFMO/jhwUbXAuzINInTPLAs8bEbDBKqpexF2M
	OTgHIVK8rK3GxTdqxxt9Him65393YgDdwHUqOeot7w2gL56lZelzQ6g=
X-Google-Smtp-Source: AGHT+IGf7f6p3B2QWzXbSlTw1NK0pPjUROlEz/T5BuJywHA6Cp2/lY5juGyE3geEn0WI2gDMWjaauQ==
X-Received: by 2002:a05:600c:198a:b0:43c:fd27:a216 with SMTP id 5b1f17b1804b1-43d52376b88mr29455795e9.23.1742572515585;
        Fri, 21 Mar 2025 08:55:15 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:2102:ce42:30c0:9b40])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d43f3328bsm81162415e9.1.2025.03.21.08.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:55:15 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] clk: amlogic: drop clk_regmap tables
In-Reply-To: <1j7c4i2xq5.fsf@starbuckisacylon.baylibre.com> (Jerome Brunet's
	message of "Fri, 21 Mar 2025 16:46:10 +0100")
References: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com>
	<20241220-amlogic-clk-drop-clk-regmap-tables-v1-2-96dd657cbfbd@baylibre.com>
	<9f1d69ebe1ddce5dfc170e986c9213f2.sboyd@kernel.org>
	<1ja5cp8f87.fsf@starbuckisacylon.baylibre.com>
	<88fe909ab182d1f17f6ef18161c7f064.sboyd@kernel.org>
	<1jfrlwb69r.fsf@starbuckisacylon.baylibre.com>
	<ed20c67e7d1a91d7fd8b921f156f56fb.sboyd@kernel.org>
	<1jmsg2adgu.fsf@starbuckisacylon.baylibre.com>
	<697b634770d789ef8ff0e05cec9465f5.sboyd@kernel.org>
	<1j4j205ark.fsf@starbuckisacylon.baylibre.com>
	<5109de7fe1a1a8467118daf80c7b7f8a.sboyd@kernel.org>
	<1j7c4i2xq5.fsf@starbuckisacylon.baylibre.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Fri, 21 Mar 2025 16:55:14 +0100
Message-ID: <1j1puq2xb1.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri 21 Mar 2025 at 16:46, Jerome Brunet <jbrunet@baylibre.com> wrote:

>>> 
>>> I admit this is heavily inspired by how devres works :) but it does solve
>>> the early clock controller problem and does not scale with the number of
>>> clock registered.
>>> 
>>
>> I don't know if devres is a good model. It's about tracking allocations
>> and things to undo later, not really to track things to do when called
>> initially.
>
> My point was more the decoupling it allows.
> Maybe it is me being too picky, but what I'm trying to do is related to the
> clock type, so it bothers me when it scales with the number of instances
> instead of the type.
>
> More generally, something devres-like allows to register an attribute
> and link it to a group. Then the group members come and just pick what
> they need. Whatever manages the attribute does not have to track
> them. That is pretty much aligned with what I'm trying to do.

Just to be clear, this idea is meant to live in /drivers/clk/meson, for
a start a least, not as something generic.

-- 
Jerome

