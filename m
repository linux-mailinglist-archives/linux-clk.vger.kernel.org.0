Return-Path: <linux-clk+bounces-28616-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F3BBAA8A1
	for <lists+linux-clk@lfdr.de>; Mon, 29 Sep 2025 21:57:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95FD63B2358
	for <lists+linux-clk@lfdr.de>; Mon, 29 Sep 2025 19:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BBE424E4AF;
	Mon, 29 Sep 2025 19:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U5RB08Jd"
X-Original-To: linux-clk@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AFB247280
	for <linux-clk@vger.kernel.org>; Mon, 29 Sep 2025 19:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759175864; cv=none; b=HSOlZRh7UP7tNOen/Iiv6HyjqO8p52eAYqN7FcY4tLPL+XtL/0ZF2Dfn0w77FDrPcydYYCeFZesiSWdHn423yEdDdvZ7PLdQ8aLUIbfsjYLubsJXIPoRMZWf7sMEUO6vjwjnblkdb80YDTzq13moSXoJuS48q722eTGD0LOZyeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759175864; c=relaxed/simple;
	bh=ILAe+VRfX0Fc+b5qLvaJzfBUJ4qz7jOpbJP92apYs7g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WQMGpaVXlabeFR1oYqUaQLh5XVI1d4V0eK2CMFZj/xn+jUa1b6iiFe++vfVqWGl13mxtUlp5d/sWDszmp9zEPUOWQ1NuBFOkV4hhmGujV3t7WpQdjNkpQPxHLQDh+TDmIbSHAliyjEPzatLRv5UgWsRXGp7GbaQx5sltI60RKVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U5RB08Jd; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2680ee37b21so9800745ad.0
        for <linux-clk@vger.kernel.org>; Mon, 29 Sep 2025 12:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759175862; x=1759780662; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ILAe+VRfX0Fc+b5qLvaJzfBUJ4qz7jOpbJP92apYs7g=;
        b=U5RB08Jdp+02qM+f5Mp+vuiVmfSvgvAx9OiS9eb/dfT+moX3pfMb+UYBBkKAocEnWD
         lb08aQk8t3PnXYbC6FKFPEpeNN+0C3ZK5K8O+tVbR+xM/l1tcssKZVmm03IKwOTCHEle
         otJ3pGwplRt2pfEJJEZvwsiu9yLStl62IrDFTM2XX7CeRRpwmQk921H0CmTYR3OS71XF
         NekIyiGHf8khHUgEJ7/Wg2ZlzVBCZ0wFeOg6ADpKhHUA9qnm0NL23qr46rSElBRBhtmX
         ruanjoQ1J/SgQ4bkiNZDbqTlMP5Xkn+l9J62YsWvCV6Vi6j5khk+VeQK0XuWqSD6UIog
         WvXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759175862; x=1759780662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ILAe+VRfX0Fc+b5qLvaJzfBUJ4qz7jOpbJP92apYs7g=;
        b=tsL6TrFu8gKzyC3FpdY5XvTlpg1KONkM2GKwS9sI77vn9RkEzPF3G6p66PQxW7I77+
         r7m5VkEU/IsGT4s29d8q5q+2Zt06ynRfn5R+xpOtsUSb57GEDgoZj94XhU+Z4U5Jkp3l
         QG1LbKTw6GB+9CqPx2WqkFEwh6g4KIe8f/Ryrk+14xy1JWqeBvV6mwTYjyGupDfVocfi
         dxl3deopVy/XKmdn35VsVs/lPxIOb1do2F2t/pk0us3a4FpdEHIDpxwP8iiqNxa83vMg
         27YVSsHwpcy3FZ8xTvlu+2U/Ah3YvAMspuLn4rN8H8UNj2AoomA5nDoIwjcC0I0Z1YTs
         nGEg==
X-Forwarded-Encrypted: i=1; AJvYcCWQQwP/1QJL6cS+i42CQYZ7J5TNJgCDXVPDcy6cghJhtWs1ElLtupoWEMzjNHbI+JFQ7Q7JnAqiAcc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyplGi2lPvX4TBjwTSyPihv/lsESfYAquR4Nr6FCw/dhUsY/uBw
	vzi6ygyhIa6TqWAHCwdM3TYYTkDH6RD8HMQBtKG8cUhQ7Q7zPzlEWW9HxeiAruJa/3+QC9hZsJE
	Mwug6nnjVGSafbrmrrWOWzaUZ5x/EZQ0=
X-Gm-Gg: ASbGnctgheodQ2/ghoFLRaFu2QWz/tiBbaOkGqHtCJ7Q9GSxueq/CAZVJZ6VSLOxgHK
	eR7ctAwnl8whjVY8KLXEx6zXag1lYe+AJA7rEcbe4TTZGncoeDi6BcCkNkVVj85vGhDEGEvC2gU
	77db1svo/844UK/WTAkN8kPuvtyd+EH26ddeNMkuAaAHrhSVZ1yDtgABu7PCx5cCw581VmEBS6f
	+pDSPlBVLl6fkBDOaYfqEK+R2scrUTZjRQyPf2VFP0zg/njFPEIq9vNA1vJOtVAKdbbQYGs6bFE
	BKBdAyL+OfhmgzPBeQAa6aW/j5NUZFtVuj54
X-Google-Smtp-Source: AGHT+IGYfATe7mmNTC4A+jEkwD5MzSelb1z0lWF68kS0t/NWgoEWKg6nD9jI4X3FoSNWbDyeH2i7qWWFajxt0X+1x5w=
X-Received: by 2002:a17:902:d501:b0:277:c230:bfc7 with SMTP id
 d9443c01a7336-27ed4a5d82bmr113039375ad.11.1759175862141; Mon, 29 Sep 2025
 12:57:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250925-core-cstr-cstrings-v2-0-78e0aaace1cd@gmail.com>
In-Reply-To: <20250925-core-cstr-cstrings-v2-0-78e0aaace1cd@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 29 Sep 2025 21:57:28 +0200
X-Gm-Features: AS18NWCM9kbfT7mylXQdGB8ZyL_b6RmUa1M3XR6zo5RoraO0TPm_DutHWVTmZ7c
Message-ID: <CANiq72m=TJMWFZhHSSU_-A3+tr5h8vA+X+oKb9TcieXQ6gHyJg@mail.gmail.com>
Subject: Re: [PATCH v2 00/19] rust: replace `kernel::c_str!` with C-Strings
To: Tamir Duberstein <tamird@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Breno Leitao <leitao@debian.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, Jens Axboe <axboe@kernel.dk>, 
	Alexandre Courbot <acourbot@nvidia.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 25, 2025 at 3:54=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Changes in v2:

For future reference, this is v3.

Cheers,
Miguel

