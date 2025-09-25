Return-Path: <linux-clk+bounces-28509-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3E9B9FCDE
	for <lists+linux-clk@lfdr.de>; Thu, 25 Sep 2025 16:05:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7DD031774D8
	for <lists+linux-clk@lfdr.de>; Thu, 25 Sep 2025 14:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E22EC2E973F;
	Thu, 25 Sep 2025 13:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kJ1QBzQQ"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D652DE702
	for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 13:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758808557; cv=none; b=YddCkaEa92Xem5jXIekfvitsG5aszTsTTEQlTl6Fvb1F3bv4r3E236T/Vgqt0JEMXGzVwQCsqcJ1Se8CIpylQxLa4Pi979j4wMifHZzGOMbU96mny9sWRJC9v4Xr0O2s79A+VHS1IiExM2VEl0sv9GbePUvRUQPQxZ19dyb0pUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758808557; c=relaxed/simple;
	bh=TE76Xl7EtGwiL3k522JoFNelrGIHYPV5uXDUZx193fk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=btJzMGt4cvs4igt9ZyBv7NtkdXJB6Lr23jMJhmom/UuAOx1il2oljt5aEvaZ4brARlpdkKE2rP1hiULDXGocyxfdxIxEj7fd9CoKv8emXAwDFZeDo9JdtbsBYh7GSTh080crrJiuSJTo7Ny5wyT+J3cBCjN/uxNqwetxpreqvhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kJ1QBzQQ; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-84ab207c37cso75568185a.2
        for <linux-clk@vger.kernel.org>; Thu, 25 Sep 2025 06:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758808555; x=1759413355; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IbRi9B/DaIaW8U9NAWZIVdIpXCsTnUCErxxV4ovxvuk=;
        b=kJ1QBzQQnod8ikaYW54XssR+CBE3xeOc5hPHb9VMVkm40EXVbG2yI0I4JTy9k7v1V2
         xPJPBZLVEqpXdWn+b+d+yi/VR3bTT3A8qRWqvvbLrlZC0zK4EMU6eQB6ocCdJL+STxG8
         rGtjFKtaxLVHEkxVjFk3hqKNTf53DOdJ/cPB31CF3iu9Bo4Jx7+FJJRXun5NuVDK5R0T
         XEE+P7wWItGg7cidouV0rTIv1sdBr/NZ8eT/ErtQPMdbjvPQ7EMvq41rnAmJkvHTqQpM
         jsXPHNd26pnlqGcpVzITl7z1hZ4Jm5dKwib+hGhygoPE13itEfZhletKi6i6fRZtxWbx
         sGZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758808555; x=1759413355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IbRi9B/DaIaW8U9NAWZIVdIpXCsTnUCErxxV4ovxvuk=;
        b=arolzJpVZ5sFR9W9ySMBF/n6vBTcKOil4fYfIT8b1wCuX6mXFn8HFwL2IU1cU8PY4r
         bJFw2dXVXjzwjbQgxt6xyeS6yS9CzzcvfgI/ky3PRVWpicTBO1K5AFeJ7h4GjgVx/1Xt
         7s9iaghZvYCwm4Xw7eutYf5sFNKamDH5XKVG3hW3CeGuTb/F4EcCvm421oXTFtQB0mVS
         XH+6ciwlqQ8QxjyX6OA4BJN73HmTe2y8jWaI8FnSELSpaNuA1m5p1Z7KmEU19ZMzCZ6g
         x8plTojXVtCazZ8D0x2ZgWC7WAeQFz10hKQjcDmHkfEltpRvaEoMK0/RbuS1Xii0o3Dd
         GeDA==
X-Forwarded-Encrypted: i=1; AJvYcCXVZlRzx2RRN4bDYLw7e3sm2XVK1QAqXxnppagMV8bz7K3zDnHhm2TnHGuxbKB2iFwFApawKOHsabk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd8eWhsGNS9CN5GFBAhz1f//Lr1ztZVmMKg76FJAGbcSnCDaDE
	YaDpUBBK/gDSVvQDHNvgpHxdDft2tUZJVitdoHen4cy/XAFkrAKMgrTo
X-Gm-Gg: ASbGnctKLslLZiFeb3gWI89e+QxddUhhFVqed3QYx9TNdblCMN+vwR9YKp0/Z/un5CE
	E0BFf8cz2japy6nAX7N6C1Br67mo9A77/j35Ibdabb5gYG09cPX7Nnt0Gr8zldj8ek3eNTEJHQp
	wvwPz/WFyR7i4y155DRg/qRvpOBZj8H5l+HA/VDu27eiJCVcKiRokdt/8Y9JVps6N3txdM40Kh4
	HOvPNGHjognP9OC8OItNnuFi3WMd+Ku54xcQIRa21TEviZOqV62BY44lp54W2SmEkR1qzwtRVo4
	wQjGqcIDBO1XdnOyJWNt6Jhk7F0n0lxvo/4Sd+LJLu5H2jTemRIut9Aelw7z6kzZWV9VyKM2XYw
	v0UtOCRC41hZnEoLBT0AfHpcFSG39qL/CubtzA2BBflHxV87U3V0QXaQBICg8rzhZkYOolPdx3q
	MCCgCEtu0sCqAxE/OFk/YaDV1D/6IR5UZS789D2JrYMKjRGEVYggF9S4oBMwcBGUDODKL6
X-Google-Smtp-Source: AGHT+IG7SCiSfqv22MjkqMAx69OdDcsv0d2XWfzHnQ58HqF/5wRLVKKYuW5rQhqneJzNL2eu5F8jIg==
X-Received: by 2002:a05:6214:5198:b0:77f:4415:6d8b with SMTP id 6a1803df08f44-7fc28076ae1mr36287846d6.8.1758808554316;
        Thu, 25 Sep 2025 06:55:54 -0700 (PDT)
Received: from 137.1.168.192.in-addr.arpa ([2600:4808:6353:5c00:7c:b286:dba3:5ba8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-80135968d5esm11536916d6.12.2025.09.25.06.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 06:55:53 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 25 Sep 2025 09:54:04 -0400
Subject: [PATCH v2 16/19] rust: str: replace `kernel::c_str!` with
 C-Strings
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250925-core-cstr-cstrings-v2-16-78e0aaace1cd@gmail.com>
References: <20250925-core-cstr-cstrings-v2-0-78e0aaace1cd@gmail.com>
In-Reply-To: <20250925-core-cstr-cstrings-v2-0-78e0aaace1cd@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Breno Leitao <leitao@debian.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
 Jens Axboe <axboe@kernel.dk>, Alexandre Courbot <acourbot@nvidia.com>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-pci@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1758808438; l=1351;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=TE76Xl7EtGwiL3k522JoFNelrGIHYPV5uXDUZx193fk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNEkH2K217WCJVB+0mC1S+mvJu9BnNI6eCwPt0AKaTiMW7gojiLm71MaiB58vh7llyUCTN8zCSP
 N0RCtgv8pDgg=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

C-String literals were added in Rust 1.77. Replace instances of
`kernel::c_str!` with C-String literals where possible.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Benno Lossin <lossin@kernel.org>
Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 rust/kernel/str.rs | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 624386cb07be..4203ce34ce98 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -272,15 +272,14 @@ impl fmt::Display for CStr {
     /// Formats printable ASCII characters, escaping the rest.
     ///
     /// ```
-    /// # use kernel::c_str;
     /// # use kernel::prelude::fmt;
     /// # use kernel::str::CStr;
     /// # use kernel::str::CString;
-    /// let penguin = c_str!("🐧");
+    /// let penguin = c"🐧";
     /// let s = CString::try_from_fmt(fmt!("{penguin}"))?;
     /// assert_eq!(s.to_bytes_with_nul(), "\\xf0\\x9f\\x90\\xa7\0".as_bytes());
     ///
-    /// let ascii = c_str!("so \"cool\"");
+    /// let ascii = c"so \"cool\"";
     /// let s = CString::try_from_fmt(fmt!("{ascii}"))?;
     /// assert_eq!(s.to_bytes_with_nul(), "so \"cool\"\0".as_bytes());
     /// # Ok::<(), kernel::error::Error>(())

-- 
2.51.0


